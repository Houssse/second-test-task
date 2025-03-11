# frozen_string_literal: true

require 'test_helper'

class ArticlePolicyTest < ActiveSupport::TestCase
  def setup
    @admin_user = User.new(admin: true)
    @regular_user = User.new(admin: false)
    @article = Article.new
  end

  def test_new_with_admin
    policy = ArticlePolicy.new(@admin_user, @article)
    assert policy.new?
  end

  def test_new_with_regular_user
    policy = ArticlePolicy.new(@regular_user, @article)
    assert_not policy.new?
  end

  def test_create_with_admin
    policy = ArticlePolicy.new(@admin_user, @article)
    assert policy.create?
  end

  def test_create_with_regular_user
    policy = ArticlePolicy.new(@regular_user, @article)
    assert_not policy.create?
  end

  def test_edit_with_admin
    policy = ArticlePolicy.new(@admin_user, @article)
    assert policy.edit?
  end

  def test_edit_with_regular_user
    policy = ArticlePolicy.new(@regular_user, @article)
    assert_not policy.edit?
  end

  def test_update_with_admin
    policy = ArticlePolicy.new(@admin_user, @article)
    assert policy.update?
  end

  def test_update_with_regular_user
    policy = ArticlePolicy.new(@regular_user, @article)
    assert_not policy.update?
  end

  def test_destroy_with_admin
    policy = ArticlePolicy.new(@admin_user, @article)
    assert policy.destroy?
  end

  def test_destroy_with_regular_user
    policy = ArticlePolicy.new(@regular_user, @article)
    assert_not policy.destroy?
  end
end
