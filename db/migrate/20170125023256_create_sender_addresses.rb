class CreateSenderAddresses < ActiveRecord::Migration[5.0]
  def change
    create_table :sender_addresses do |t|
      t.integer :user_id
      t.string :email

      t.timestamps
    end
  end
end
