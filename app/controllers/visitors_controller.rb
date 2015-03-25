class VisitorsController < ApplicationController
	def new
		@default_feed = Feed.where(Isadmin:true, IsPublished:true).order("id desc")
		first_feed = @default_feed.take
		if first_feed != nil and @default_feed.count == 1 and 
			redirect_to "/feeds/location/"+first_feed.friendly_id.to_s
		end
		# default_product_list = default_feed.ProductList
		# product_tokenized = default_feed.ProductList.split(",")
		
		# product_id_list = ProductInFeed.select("productid").where(FeedId:default_feed.id)  
	 #    product_tokenized = product_id_list.map(&:productid)
	  
		# @test = { 'Oracle' => @q_oracle, 'Ruby and Rails' => @q_ruby }
	end

	def account
		user_id = current_user.id
		@user_detail_record = UserDetail.find_by_id(user_id)
	end

	def landingsignup
		email_addr = params[:EmailSignUp]
		if email_addr != nil
			preview_sign_up = PreviewSignUp.where( :EmailAddress => email_addr ).take
			if preview_sign_up == nil
				preview_sign_up = PreviewSignUp.new( :EmailAddress => email_addr )
				preview_sign_up.save
			end
		end
		
	end

	def aboutus

	end

	

	def display
		@test = 'hello world'
	end

	def landing
		@asset_path = ActionController::Base.helpers.asset_path('background.jpg')
		@imagelink = URI.join(request.original_url, @asset_path )
	end
end
