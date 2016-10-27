class DeviseTokenAuthCreateCompanies < ActiveRecord::Migration[5.0]
  def change
    create_table(:companies) do |t|
      ## Required
      t.string :provider, :null => false, :default => "email"
      t.string :uid, :null => false, :default => ""

      ## Database authenticatable
      t.string :encrypted_password, :null => false, :default => ""

      ## Recoverable
      t.string   :reset_password_token
      t.datetime :reset_password_sent_at

      ## Rememberable
      t.datetime :remember_created_at

      ## Trackable
      t.integer  :sign_in_count, :default => 0, :null => false
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
      # t.integer  :failed_attempts, :default => 0, :null => false # Only if lock strategy is :failed_attempts
      # t.string   :unlock_token # Only if unlock strategy is :email or :both
      # t.datetime :locked_at

      ## User Info
      t.string :company_name
      t.string :company_number
      t.string :image
      t.string :email

      ## Tokens
      t.json :tokens

      t.timestamps
    end

    add_index :companies, :email
    add_index :companies, [:uid, :provider],     :unique => true
    add_index :companies, :reset_password_token, :unique => true
    # add_index :companies, :confirmation_token,   :unique => true
    # add_index :companies, :unlock_token,         :unique => true
  end
end
