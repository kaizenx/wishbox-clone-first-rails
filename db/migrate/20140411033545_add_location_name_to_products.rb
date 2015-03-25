class AddLocationNameToProducts < ActiveRecord::Migration
  def change
    add_column :products, :LocationName, :string
  end
end
