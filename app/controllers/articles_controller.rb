class ArticlesController < ApplicationController
  def index
    @articles = Article.all.order(writing_date: :desc)
  end

  def show
  end

  def new
  end
end
