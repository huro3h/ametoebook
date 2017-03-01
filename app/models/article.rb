class Article < ApplicationRecord
  validates :title, :theme, presence: true
  validates :title, uniqueness: true

  def self.by_calendar(cal)
  end
end
