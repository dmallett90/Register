class CreateUsers < ActiveRecord::Migration
  def self.up
    create_table :users do |t|
      t.string :first_name
      t.string :last_name
      t.string :street
      t.string :city
      t.string :zip
      t.string :mobile_phone
      t.string :home_phone
      t.string :other_phone
      t.string :email
      t.boolean :optin

      t.timestamps
    end
  end

  def self.down
    drop_table :users
  end
end
