class AddColumnToArticle < ActiveRecord::Migration[5.0]
  def change
    add_column :articles, :name, :string
    add_column :articles, :status, :integer
  end
end
