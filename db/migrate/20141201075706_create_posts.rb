class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
		t.integer "account_id"
		t.integer "debate_id"		
	    t.timestamps
    end
    
    add_index("posts", "debate_id")
    add_index("posts", "account_id")
  end
end
