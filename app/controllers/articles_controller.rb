# frozen_string_literal: true

class ArticlesController < ApplicationController
  before_action :set_article, only: %i[show edit update destroy]
  before_action :authenticate_user!, only: %i[new create edit update destroy]

  def index
    @articles = Article.includes(:user)
  end

  def show; end

  def new
    @article = Article.new
    authorize @article
  end

  def edit
    authorize @article
  end

  def create
    @article = Article.new(article_params)
    authorize @article
    @article.user = current_user

    if @article.save
      redirect_to @article, notice: t('.success')
    else
      render :new, status: :unprocessable_entity
    end
  end


  def update
    authorize @article
    if @article.update(article_params)
      redirect_to @article, notice: t('.success')
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    authorize @article
    @article.destroy

    redirect_to root_path, notice: t('.success')
  end

  private

  def article_params
    params.require(:article).permit(:title, :body)
  end

  def set_article
    @article = Article.find(params[:id])
  end
end
