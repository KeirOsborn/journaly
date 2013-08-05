class CreateInstagramAccounts < ActiveRecord::Migration
  def change
    create_table :instagram_accounts do |t|
      t.integer :uid
      t.string :token
      t.references :user

      t.timestamps
    end
    add_index :instagram_accounts, :user_id
  end
end
