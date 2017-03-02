require 'rails_helper'

describe Article do
  it 'タイトルとテーマがあれば有効な状態であること' do
    article = Article.new(
      title: "今日の出来事",
      theme: "日記")
    expect(article).to be_valid
  end

  it 'タイトルがなければ無効な状態であること' do
    article = Article.new(title: nil)
    article.valid?
    expect(article.errors[:title]).to include("can't be blank")
  end

  it 'テーマがなければ無効な状態であること' do
    article = Article.new(theme: nil)
    article.valid?
    expect(article.errors[:theme]).to include("can't be blank")
  end

  it '重複したタイトルなら無効な状態であること' do
    Article.create(
      title: "ああああ",
      theme: "日記"
      )

    article = Article.new(
      title: "ああああ",
      theme: "雑談"
      )
    article.valid?
    expect(article.errors[:title]).to include("has already been taken")
  end

  it '同じ日に複数件投稿できること' do
    article1 = Article.create(
      title: "ああああ",
      theme: "日記",
      writing_date: "2017-02-28"
      )

    article2 = Article.create(
      title: "いいいい",
      theme: "日記",
      writing_date: "2017-02-28"
      )
    expect(article2).to be_valid
  end

  it 'マッチしたtitleをソート済みの配列として返すこと' do
    article1 = Article.create(
      title: "aas",
      theme: "日記",
      writing_date: "2017-02-28"
      )

    article2 = Article.create(
      title: "abbb",
      theme: "日記",
      writing_date: "2017-02-16"
      )

    article3 = Article.create(
      title: "avv",
      theme: "日記",
      writing_date: "2017-02-25"
      )

    article4 = Article.create(
      title: "cccc",
      theme: "日記",
      writing_date: "2017-01-23"
      )
    expect(Article.by_calendar("a").pluck(:title)).to eq ["aas",
     "abbb", "avv"]
  end
end

