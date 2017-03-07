class Article < ApplicationRecord
  validates :title, :theme, presence: true
  validates :title, uniqueness: true

  require 'open-uri'
  require 'nokogiri'

  def self.by_title(title)
    where("title LIKE ?", "#{title}%").order(:title)
  end

  def get_list(blogid)
    url = 'http://ameblo.jp/' + blogid + '/entrylist.html'
    html = open(url) { |f| f.read }
    # p html
    doc = Nokogiri::HTML.parse(html, nil)
    doc.css(".contentTitleArea").each do |entry|
      p entry.css('h1').text
      p entry.css('h1 a.contentTitle').text
    end
  end

  def get_article

  end

end
