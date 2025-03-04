# frozen_string_literal: true

class Article < ApplicationRecord
  belongs_to :user

  validates :title, length: { minimum: 3, maximum: 255 }, presence: true
  validates :body, length: { minimum: 200 }, presence: true
end
