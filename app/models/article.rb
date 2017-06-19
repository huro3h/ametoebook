class Article < ApplicationRecord
  has_many :comments, dependent: :destroy

  validates :title, :writing_date, presence: true
  validates :title, :url, uniqueness: true

  require 'open-uri'
  require 'nokogiri'

  def self.by_title(title)
    where("title LIKE ?", "#{title}%").order(:title)
  end

  def get_urls(page_no="")
    urls = "http://ameblo.jp/sakenomi1730/entrylist#{page_no}.html"
  end


  def get_a(blog_url)
    article = Article.new
    url = blog_url
    html = open(url) { |f| f.read }
    doc = Nokogiri::HTML.parse(html, nil)
    doc.css(".js-entryWrapper").each do |entry|
      article.title = entry.css('h1').text.to_s.gsub(/(\s)/,"")
      article.url = entry.css('a')[0][:href].to_s
      article.writing_date = entry.css('time').text.to_datetime
      article.detail = entry.css('div.articleText').text.gsub(/(\s)/,"")
      article.theme = entry.css('span.articleTheme').text.gsub(/テーマ：/,"")
      article.save
    end
  end
end
