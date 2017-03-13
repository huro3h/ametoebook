class Article < ApplicationRecord
  validates :title, :writing_date, presence: true
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
    tag = doc.xpath("//time")
    # p doc
    p tag
    doc.css(".contentTitleArea").each do |entry|
      binding.pry
      article = Article.new
      article.title = entry.css('a').text.to_s
      article.url = entry.css('a')[0][:href].to_s
      article.writing_date = tag.first.children.to_s.to_datetime
      article.save
    end
  end

  def get_article

  end

end
