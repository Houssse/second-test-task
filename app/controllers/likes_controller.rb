# frozen_string_literal: true

class LikesController < ApplicationController
  before_action :authenticate_user!, only: %i[create destroy]

  def create
    @article = Article.find(params[:article_id])
    @like = @article.likes.find_or_create_by(user: current_user)

    redirect_to(article_path(@article))
  end

  def destroy
    @article = Article.find(params[:article_id])
    @like = @article.likes.find(params[:id])

    @like.destroy if @like.user == current_user

    redirect_to(article_path(@article))
  end
end
