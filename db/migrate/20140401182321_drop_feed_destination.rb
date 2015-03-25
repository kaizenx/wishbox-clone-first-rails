class DropFeedDestination < ActiveRecord::Migration
  def change
  	if table_exists?(:feed_destinations)
  	  drop_table :feed_destinations
  	end
  end
end
