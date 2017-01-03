class CreateArticles < ActiveRecord::Migration[5.0]
  def change
    create_table :articles do |t|
      t.text :title
      t.date :writing_date
      t.string :theme
      t.text :detail

      t.timestamps
    end
  end
end
