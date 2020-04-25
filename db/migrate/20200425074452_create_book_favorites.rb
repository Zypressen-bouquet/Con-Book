class CreateBookFavorites < ActiveRecord::Migration[5.2]
  def change
    create_table :book_favorites do |t|

      t.timestamps
    end
  end
end
