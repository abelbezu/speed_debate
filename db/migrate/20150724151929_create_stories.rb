class CreateStories < ActiveRecord::Migration
  def change
    create_table :stories do |t|
      t.references :topic
      t.string :og_topic
      t.text :og_description
      t.text :og_image_url
      t.string :og_type
      t.timestamps
    end
  end
end
