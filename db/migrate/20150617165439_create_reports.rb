class CreateReports < ActiveRecord::Migration
  def change
    create_table :reports do |t|
     t.integer :account_id
     t.text :issue
     t.string :page
     t.timestamps
    end
  end
end
