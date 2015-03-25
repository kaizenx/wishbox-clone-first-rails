class Feed < ActiveRecord::Base
	belongs_to :user
	has_many :product_in_feeds
	extend FriendlyId
  	friendly_id :slug, use: :slugged
end
