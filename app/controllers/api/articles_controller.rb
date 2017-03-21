module Api
  class ArticlesController < ApplicationController
    def index
      @articles = Article.all.order(writing_date: :desc)
      render json: @articles
    end
  end
end