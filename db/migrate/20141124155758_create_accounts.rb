class CreateAccounts < ActiveRecord::Migration
  def up
    create_table :accounts do |t|
      t.string 'first_name', :limit => 50
      t.string 'last_name', :limit => 50
      t.string 'email', :null => false, default: ""
      t.string 'gender'
      t.string 'password'
      t.string "oauth_token"
      t.string "provider"
      t.string 'refresh_token'
      t.datetime 'oauth_expires_at'
      t.string 'display_name', :limit => 50
      
      
      
      t.timestamps
    end
  end
  def down
  	drop_table :accounts
  end
end
