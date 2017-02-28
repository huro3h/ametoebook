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
end

