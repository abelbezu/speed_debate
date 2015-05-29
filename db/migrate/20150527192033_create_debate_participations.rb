class CreateDebateParticipations < ActiveRecord::Migration
  def up
    create_table :debate_participations do |t|
      t.references :account
      t.references :debate
      t.string "role"
      t.string "side"

      t.timestamps
    end
    add_index :debate_participations, ["account_id", "debate_id"]
  end
  def down
  	drop_table :debate_participations
  end 
end
