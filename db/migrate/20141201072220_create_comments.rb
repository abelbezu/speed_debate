class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
    	t.integer "account_id"
    	t.integer "post_id"
    	t.integer "reply_level", :default =>0
        t.timestamps
    end
    add_index("comments", "account_id")
    add_index("comments", "post_id")
  end
end
