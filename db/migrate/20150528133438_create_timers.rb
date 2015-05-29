class CreateTimers < ActiveRecord::Migration
  def change
    create_table :timers do |t|
      t.references :timed, polymorphic: true
      t.datetime :start, :null => false, default: DateTime.now
      t.datetime :pos
      t.datetime :end, :null => false, default: DateTime.now + 7
      t.string 	 :status
      t.timestamps
    end
    add_index :timers, :timed_id
  end
end
