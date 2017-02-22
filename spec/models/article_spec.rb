require 'rails_helper'

describe Article do
  it 'タイトルとテーマがあれば有効な状態であること' do
    article = Article.new(
      title: "今日の出来事",
      theme: "日記"
      )
    expect(article).to be_valid
  end

  it 'タイトルがなければ無効な状態であること' do
    article = Article.new(title: nil)
    article.valid?
    expect(article.errors[:title]).to include("can't be blank")
  end

  it 'テーマがなければ無効な状態であること' do
  end

  it '重複したタイトルなら無効な状態であること' do
  end
end

