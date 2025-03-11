class AddLikesCountToArticle < ActiveRecord::Migration[7.2]
  def change
    add_column(:articles, :likes_count, :integer, default: 0, null: false)
  end
end
