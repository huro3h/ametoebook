class ChangeDatatypeWritingDateOfArticles < ActiveRecord::Migration[5.0]
  def change
    change_column :articles, :writing_date, :datetime
  end
end
