class CreateContactUs < ActiveRecord::Migration
  def change
    create_table :contact_us do |t|
      t.string :FirstName
      t.string :LastName
      t.string :Email
      t.text :Comment, :limit => nil

      t.timestamps
    end
  end
end
