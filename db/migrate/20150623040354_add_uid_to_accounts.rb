class AddUidToAccounts < ActiveRecord::Migration
    def up
  	add_column "accounts", 'uid', :integer, :limit => 8
  	
  end
  def down
  	remove_column "accounts", 'uid'
  	
  end 
end
