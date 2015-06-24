class AddDeviseToAccounts < ActiveRecord::Migration
  def self.up
    change_table(:accounts) do |t|
      #added by me
      
      #remove_column "accounts", "email"
      #remove_column "accounts", "password_digest"

      ## Database authenticatable
       
      #t.string :email,              null: false, default: ""
      t.string :encrypted_password, null: false, default: ""

      ## Recoverable
      t.string   :reset_password_token
      t.datetime :reset_password_sent_at

      ## Rememberable
      t.datetime :remember_created_at

      ## Trackable
      t.integer  :sign_in_count, default: 0, null: false
      t.datetime :current_sign_in_at
      t.datetime :last_sign_in_at
      t.string   :current_sign_in_ip
      t.string   :last_sign_in_ip

      ## Confirmable
      t.string   :confirmation_token
      t.datetime :confirmed_at
      t.datetime :confirmation_sent_at
      t.string   :unconfirmed_email # Only if using reconfirmable

      ## Lockable
      # t.integer  :failed_attempts, default: 0, null: false # Only if lock strategy is :failed_attempts
      # t.string   :unlock_token # Only if unlock strategy is :email or :both
      # t.datetime :locked_at


      # Uncomment below if timestamps were not included in your original model.
      # t.timestamps null: false
    end

    add_index :accounts, :email,                unique: true
    add_index :accounts, :reset_password_token, unique: true
    # add_index :accounts, :confirmation_token,   unique: true
    # add_index :accounts, :unlock_token,         unique: true
  end

  def self.down
    remove_column "accounts", "encrypted_password"
    #add_column "accounts", 'password_digest', :string

     ## Recoverable
    remove_column "accounts", "reset_password_token"
    remove_column "accounts", "reset_password_sent_at"
    
    ## Rememberable
    remove_column "accounts", "remember_created_at"

    ## Trackable
    remove_column "accounts", "sign_in_count"
    remove_column "accounts", "current_sign_in_at"
    remove_column "accounts", "last_sign_in_at"
    remove_column "accounts", "current_sign_in_ip"
    remove_column "accounts", "last_sign_in_ip"

    ## Confirmable
    remove_column "accounts", "confirmation_token"
    remove_column "accounts", "confirmed_at"
    remove_column "accounts", "confirmation_sent_at"
    remove_column "accounts", "unconfirmed_email"



    # By default, we don't want to make any assumption about how to roll back a migration when your
    # model already existed. Please edit below which fields you would like to remove in this migration.
    #raise ActiveRecord::IrreversibleMigration
  end
end
