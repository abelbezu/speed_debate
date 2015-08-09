class AddVisibilityToTopics < ActiveRecord::Migration
  def change
  	add_column "topics", 'visibility', :string, default: "visible"
  end
end
