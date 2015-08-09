class AddStatusToChallenge < ActiveRecord::Migration
  def change
  	add_column "challenges", 'status', :string, :default => "accepted"
  end
end
