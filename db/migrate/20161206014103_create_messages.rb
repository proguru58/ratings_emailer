class CreateMessages < ActiveRecord::Migration[5.0]
  def change
    create_table :messages do |t|
      t.integer :user_id
      t.string :email
      t.string :subject
      t.text :content
      t.string :status
      t.integer :rating, :default => 0

      t.timestamps
    end
  end
end
