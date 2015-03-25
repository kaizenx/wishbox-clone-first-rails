class Users::OmniauthCallbacksController < Devise::OmniauthCallbacksController
  def facebook
    # You need to implement the method below in your model (e.g. app/models/user.rb)
    @user = User.find_for_facebook_oauth(request.env["omniauth.auth"])

    if @user.persisted?
      session["authdata"] = request.env["omniauth.auth"]["credentials"]["token"]
      sign_in_and_redirect @user, :event => :authentication #this will throw if @user is not activated
      set_flash_message(:notice, :success, :kind => "Facebook") if is_navigational_format?
      oauth_access_token = session['authdata']
      if oauth_access_token != nil
        @graph = Koala::Facebook::API.new(oauth_access_token)
        profile = @graph.get_object("me")
        puts profile["email"]
        user_detail_record = UserDetail.where(:Email=>profile["email"], :UserId => @user.id ).take
        if user_detail_record == nil
          credit = 0
          preview_sign_up = PreviewSignUp.where(:EmailAddress => profile["email"])
          if preview_sign_up != nil
            credit = 5
          end
          user_detail_record = UserDetail.new(:Email => profile["email"], :UserId => @user.id, :Credit => credit )
          user_detail_record.save
        end
      end
    else
      session["devise.facebook_data"] = request.env["omniauth.auth"]
      redirect_to new_user_registration_url
    end
  end
end