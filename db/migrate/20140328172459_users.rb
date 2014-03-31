class Users < ActiveRecord::Migration
	def change
		create_table :users do |t|
		t.string :username
		t.string :encrypted_password
		t.string :email_id
		t.string :address
		t.string :salt
		t.string :phone_no
	t.timestamps
	end
end
end
