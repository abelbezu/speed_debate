class CreateNotifications < ActiveRecord::Migration
  def change
    create_table :notifications do |t|
      t.integer "account_id"
      t.integer "sender_id"
      t.integer "sender_type"
      t.text "message"
      t.boolean "checked", default: false
      t.string "url"
      t.timestamps

     
    end
  end
end
