class CreateAccountDetails < ActiveRecord::Migration
  def change
    create_table :account_details do |t|
 	  t.references :account
 	  t.string :occupation, :default => "Gladiator"
 	  t.text :description
 	  t.timestamps
    end
  end
end
