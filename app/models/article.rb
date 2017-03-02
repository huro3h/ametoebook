class Article < ApplicationRecord
  validates :title, :theme, presence: true
  validates :title, uniqueness: true

  def self.by_title(title)
    where("title LIKE ?", "#{title}%").order(:title)
  end
end
