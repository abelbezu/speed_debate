class CreateChallenges < ActiveRecord::Migration
  def change
    create_table :challenges do |t|
     t.references :topic
     t.integer :challenger_id
     t.integer :challengee_id
     t.string :challengee_email
      t.timestamps
    end
  end
end
