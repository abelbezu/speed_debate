class CreateUserActivities < ActiveRecord::Migration
  def change
    create_table :user_activities do |t|
      t.references :account
      t.datetime   "last_seen"
      t.string "status"
      t.string "update_status", :default => "expired"
      t.timestamps
    end
    add_index :user_activities, "account_id"
  end
end
