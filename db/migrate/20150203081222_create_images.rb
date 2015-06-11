class CreateImages < ActiveRecord::Migration
  def up
    create_table :images do |t|
      t.integer "image_owner_id"
      t.string "image_owner_type"
      t.string "url"
      t.string "picture"
      t.string "image_use"
      t.timestamps
    end

    add_index :images, "image_owner_id"

  end
  def down
    drop_table :images
  end 
end
