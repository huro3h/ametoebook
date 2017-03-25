class ArticlesController < ApplicationController
  respond_to :json

  def index
    @articles = Article.all.order(writing_date: :desc)
  end

  def show
  end

  def new
  end
end
