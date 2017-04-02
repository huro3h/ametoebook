class ArticlesController < ApplicationController
  # respond_to :json

  def index
    @articles = Article.all.order(writing_date: :desc)
    # render json: @articles
  end

  def home
  end

  def show
  end

  def new
  end

  def create
    article = Article.new
    article.get_a
  end
end
