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
    # add_index "debates", ["left_debater_id", "right_debater_id"]
  end
end
