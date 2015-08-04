class AddOgUrlToStories < ActiveRecord::Migration
  def change
  	add_column "stories", 'og_url', :string
  end
end
