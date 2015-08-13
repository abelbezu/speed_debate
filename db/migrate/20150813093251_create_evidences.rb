class CreateEvidences < ActiveRecord::Migration
  def change
    create_table :evidences do |t|
      t.references :post
      t.string :og_topic
      t.text :og_description
      t.text :og_image_url
      t.string :og_type
      t.string :og_url
      t.timestamps
    end
  end
end
