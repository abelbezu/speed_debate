class CreateLogs < ActiveRecord::Migration
  def change
    create_table :logs do |t|
      t.integer :current_user_id
      t.text :event_log
      t.text :param
      t.timestamps
    end
  end
end
