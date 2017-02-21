class ArticlesController < ApplicationController
  def index
    @articles = Article.all if Article.present?
  end

  def show
  end

  def new
  end
end
