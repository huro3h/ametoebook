class ArticlesController < ApplicationController
  # respond_to :json

  def index
    @articles = Article.all.order(writing_date: :desc)
    # render json: @articles
  end

  def home
  end

  def show
    @article = Article.find(params[:id])
  end

  def new
  end

  def create
    article = Article.new
    article.get_a
  end
end
