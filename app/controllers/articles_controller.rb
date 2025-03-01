# frozen_string_literal: true

class ArticlesController < ApplicationController
  def index
    @articles = Article.includes(:user)
  end
end
