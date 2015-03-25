class Product < ActiveRecord::Base
	has_many :user_shopping_cart
	extend FriendlyId
  	friendly_id :Title, use: :slugged
end
