class Article < ApplicationRecord
  validates :title, :theme, presence: true
  validates :title, uniqueness: true
end
