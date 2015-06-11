class CreateTopics < ActiveRecord::Migration
  def up
    create_table :topics do |t|
    	t.integer "account_id"
    	t.string "topic_sentence", :null => false, default: "Debate Topic"
    	t.string "description"
    	t.string "left_side_topic", :default => "For"
    	t.string "right_side_topic", :default => "Against"
    	t.string "category"
    	t.string "tags"

      t.timestamps
    end
    add_index('topics', "account_id")

  end
  def down
  	drop_table :topics
  end 
end
