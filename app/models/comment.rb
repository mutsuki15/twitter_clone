# frozen_string_literal: true

class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :tweet
  validates :content, presence: true, length: { maximum: 140 }, unless: proc { image.attached? }

  has_many :favorites, dependent: :destroy
  has_many :retweets, dependent: :destroy
  has_many_attached :image
end
