class CreateBookmarks < ActiveRecord::Migration[5.0]
  def change
    create_table :bookmarks do |t|
      t.string :mark

      t.timestamps
    end
  end
end
