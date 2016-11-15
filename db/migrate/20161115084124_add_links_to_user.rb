class AddLinksToUser < ActiveRecord::Migration[5.0]
  def change
    reversible do |dir|
      change_table :users do |t|
        dir.up {
          t.string :negative_rating_link
        }
        dir.up {
          t.string :positive_rating_link
        }
        dir.down {
          t.remove :positive_rating_link
        }
        dir.down {
          t.remove :negative_rating_link
        }
      end
    end
  end
end
