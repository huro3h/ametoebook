class Article < ApplicationRecord
  validates :title, :theme, presence: true
  validates :title, uniqueness: true

  require 'open-uri'
  require 'nokogiri'

  def self.by_title(title)
    where("title LIKE ?", "#{title}%").order(:title)
  end

  def get_list#(blogid)
    url = 'http://ameblo.jp/sakenomi1730/entrylist.html'
    # url = 'http://ameblo.jp/sakenomi1730/entrylist.html'
    # url = 'http://ameblo.jp/' + blogid + '/entrylist.html'
    html = open(url) { |f| f.read }
    # p html
    doc = Nokogiri::HTML.parse(html, nil)
    p doc
    doc.css(".contentTitleArea").each do |entry|
      p entry.css('h1').text
      # p entry.class('articleText').text
    end
  end

  def get_article

  end

end
