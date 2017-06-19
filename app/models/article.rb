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
    urls = page_no == ""  ? "http://ameblo.jp/sakenomi1730/entrylist.html" : "http://ameblo.jp/sakenomi1730/entrylist-#{page_no}.html"
    html = open(urls) { |f| f.read }
    doc = Nokogiri::HTML.parse(html, nil)
    # binding.pry
    doc.css(".contentTitleArea").each do |entry|
      puts entry.css('a')[0][:href].to_s
    end
    page_no == "" ? "1ページ目処理完了" : "#{page_no}ページ目処理完了"
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
