# frozen_string_literal: true

require 'test_helper'

class ArticlesControllerTest < ActionDispatch::IntegrationTest
  def setup
    @user = users(:one)
    @admin = users(:two)
    @article = articles(:one)

    sign_in @admin
  end

  test 'should create article' do
    params = {
      article: {
        title: 'Test Article',
        body: 'This is a test article.' }
    }

    post(articles_path, params:)

    new_article = Article.find_by(title: 'Test Article')
    assert new_article
  end

  test 'should update article' do
    params = {
      article: {
        title: 'Updated Article',
        body: 'This is an updated article.' }
    }

    patch(article_path(@article), params:)

    updated_article = Article.find(@article.id)
    assert_equal 'Updated Article', updated_article.title
  end

  test 'should destroy article' do
    delete(article_path(@article))

    assert_nil Article.find_by(id: @article.id)
  end
end
