class ChangeDescriptionColumnsToText2 < ActiveRecord::Migration
  def change
  	change_column :feeds, :Description, :text, :limit => nil
  	change_column :products, :Description, :text, :limit => nil
  	change_column :products, :Highlights, :text, :limit => nil
  	change_column :products, :Condition, :text, :limit => nil
  end
end
