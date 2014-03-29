class Admins < ActiveRecord::Migration
   def change
	create_table :admins do |t|
	t.string :username
	t.string :encrypted_password


   end
  end
end
