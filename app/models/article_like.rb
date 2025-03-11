# frozen_string_literal: true

class ArticleLike < ApplicationRecord
  belongs_to :user
  belongs_to :article, counter_cache: :likes_count

  validates :user_id, uniqueness: { scope: :article_id }
end
