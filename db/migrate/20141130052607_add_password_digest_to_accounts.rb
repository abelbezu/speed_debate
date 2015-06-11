class AddPasswordDigestToAccounts < ActiveRecord::Migration
  def up
  	add_column "accounts", 'password_digest', :string
  	remove_column "accounts", "password"
  end
  def down
  	remove_column "accounts", 'password_digest'
  	add_column "accounts", "password", :string, :null =>false, :limit =>32, default: "123456789"
  end 
end
