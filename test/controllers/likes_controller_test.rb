# frozen_string_literal: true

require 'test_helper'

class LikesControllerTest < ActionDispatch::IntegrationTest
  def setup
    @user = users(:one)
    @user_two = users(:two)
    @article = articles(:one)
    @like = article_likes(:one)
    sign_in @user
  end
  test 'сreate  article like' do
    post article_likes_path(@article)

    assert_equal 1, @article.likes.count

    assert_redirected_to article_path(@article)
  end

  test 'delete article like' do
    delete article_like_url(articles(:one).id, article_likes(:one).id)

    assert_response :redirect

    deleted_article_like = ArticleLike.find_by(id: article_likes(:one).id)

    assert_nil(deleted_article_like, 'Article like should be deleted')
  end

  test 'destroyed by another user' do
    @article.likes.create
    sign_in @user_two

    delete article_like_path(@article, @like)

    assert_equal 1, @article.likes.count
  end
end
