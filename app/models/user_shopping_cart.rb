class UserShoppingCart < ActiveRecord::Base
	belongs_to :user
	has_one :product, foreign_key: "id"
end
