class CreateDebateRooms < ActiveRecord::Migration
  def change
    create_table :debate_rooms do |t|
      t.references :topic
      t.text :video_url
      t.timestamps
    end
  end
end
