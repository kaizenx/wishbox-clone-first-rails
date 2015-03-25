class User < ActiveRecord::Base
	# Include default devise modules. Others available are:
	# :confirmable, :lockable, :timeoutable and :omniauthable
	devise :database_authenticatable, :registerable,
	     :recoverable, :rememberable, :trackable, :validatable, :omniauthable, :omniauth_providers => [:facebook]
	has_many :feeds
	has_many :user_shopping_cart

	def self.find_for_facebook_oauth(auth)
  		where(auth.slice(:provider, :uid)).first_or_create do |user|
			user.provider = auth.provider
			user.uid = auth.uid
			user.email = auth.info.email
			user.password = Devise.friendly_token[0,20]
			# user.name = auth.info.name   # assuming the user model has a name
			# user.image = auth.info.image # assuming the user model has an image
			# user.update_attribute('fb_access_token', access_token)
			# @graph = Koala::Facebook::API.new(auth.token)
			# profile_image = @graph.get_picture("me")
			
			send_new_user_email
			
	   	end
  	end
  	def send_new_user_email
  		mandrill = Mandrill::API.new ENV["MANDRILL_API"]
  		
  	end
	# def self.process_omniauth(auth)
	# 	where(auth.slice(:provider, :uid)).first_or_create do |user|
	# 		user.provider = auth.provider
	# 		user.uid = auth.uid
	# 		user.username = auth.info.nickname
	# 	end
	# end
	def self.new_with_session(params, session)
		super.tap do |user|
		  if data = session["devise.facebook_data"] && session["devise.facebook_data"]["extra"]["raw_info"]
		    user.email = data["email"] if user.email.blank?
		  end
		end
	end
	# def self.new_with_session(params, session)
	# 	if session["devise.user_attributes"]
	# 		new(session["devise.user_attributes"], without_protection: true) 
	# 			do |user|
	# 				user.attributes = params
	# 				user.valid?
	# 			end
	# 	else
	# 		super
	# 	end 
	# end
	def password_required?
		super && provider.blank?
	end
	def update_with_password(params, *options)
		if encrypted_password.blank? && provider.present?
			update_attributes(params, *options)
		else
			super
		end
	end
end
