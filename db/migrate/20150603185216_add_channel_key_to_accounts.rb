class AddChannelKeyToAccounts < ActiveRecord::Migration
  def change
  	add_column :accounts, :channel_key, :string
  end
end
