class AddLocationAddressToProducts < ActiveRecord::Migration
  def change
    add_column :products, :Address, :text, :limit => nil
  end
end
