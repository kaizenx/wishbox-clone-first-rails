class AddValidityDatesToProducts < ActiveRecord::Migration
  def change
    add_column :products, :ValidityStart, :datetime
    add_column :products, :ValidityEnd, :datetime
  end
end
