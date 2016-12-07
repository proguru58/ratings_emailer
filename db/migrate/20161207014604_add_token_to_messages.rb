class AddTokenToMessages < ActiveRecord::Migration[5.0]
  def change
    add_column :messages, :token, :string, after: :rating
  end
end
