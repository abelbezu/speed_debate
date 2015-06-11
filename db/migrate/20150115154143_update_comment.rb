class UpdateComment < ActiveRecord::Migration
  
  def up
  	add_column "comments", 'main_comment_id', :integer, index: true
  	

  end

  def down
  	remove_column "comments", 'main_comment_id'
  	
  end

end
