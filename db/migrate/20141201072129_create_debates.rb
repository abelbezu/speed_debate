class CreateDebates < ActiveRecord::Migration
  def change
    create_table :debates do |t|
      t.integer "topic_id"
      t.integer "time_limit"
      t.integer "back_and_forth_limit"
      t.integer "character_limit"
      t.timestamps
    end
    add_index("debates", "topic_id")
  end
end
