class ArticlesController < ApplicationController

  def index
    @articles = Article.all.order(writing_date: :desc)
  end

  def home
  end

  def show
    @article = Article.find(params[:id])
    @comment  = @article.comments.build
  end

  def new
  end
end
