class AddWidgetToProducts < ActiveRecord::Migration
  def change
    add_column :products, :Widget1, :text
    add_column :products, :Widget2, :text
  end
end
