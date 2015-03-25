class AddDefaultCurrencyToUserDetails < ActiveRecord::Migration
  def change
    add_column :user_details, :Currency, :string
  end
end
