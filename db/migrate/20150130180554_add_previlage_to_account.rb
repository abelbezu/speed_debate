class AddPrevilageToAccount < ActiveRecord::Migration
  def up
  	add_column "accounts", 'privilege', :string, default: 'user'

  end

  def down
  	remove_column "accounts", 'privilege'
  	
  end

end
