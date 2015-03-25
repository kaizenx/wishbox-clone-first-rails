class AddCreditToUserDetails < ActiveRecord::Migration
  def change
    add_column :user_details, :Credit, :integer
  end
end
