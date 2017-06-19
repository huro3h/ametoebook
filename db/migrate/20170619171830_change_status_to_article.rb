class ChangeStatusToArticle < ActiveRecord::Migration[5.0]
  def up
    change_column :articles, :status, :integer, null: false, default: 0
  end

  #変更前の型
  def down
    change_column :articles, :status, :integer
  end
end
