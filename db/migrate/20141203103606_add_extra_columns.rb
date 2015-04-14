class AddExtraColumns < ActiveRecord::Migration
  def up
  	#additional columns to debates table
  	add_column "debates", 'audience_number', :integer, :default => 0 
  	add_column "debates", 'left_side_number', :integer, :default => 0
  	add_column "debates", 'right_side_number', :integer, :default => 0
  	add_column "debates", 'neutral_number', :integer, :default => 0
  	#additional columns to post table
  

  	#additional columns to contents table
  	add_column "contents", 'picture', :string
  	add_column "contents", "video", :string
    add_column "contents", "topic_id", :integer

    #index contents by topic
    add_index("contents", "topic_id")
  end
  def down
  	#additional columns to debates table
  	remove_column "debates", 'audience_number'
  	remove_column "debates", 'left_side_number'
  	remove_column "debates", 'right_side_number'
  	remove_column "debates", 'neutral_number'
  	#additional columns to post table
  

  	#additional columns to contents table
  	remove_column "contents", 'picture'
  	remove_column "contents", "video"
  end 
end
