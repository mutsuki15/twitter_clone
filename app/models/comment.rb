# frozen_string_literal: true

class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :tweet
  validates :content, presence: true

  has_many :favorites, dependent: :destroy
  has_many :retweets, dependent: :destroy
end
