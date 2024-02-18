# frozen_string_literal: true

class Tweet < ApplicationRecord
  belongs_to :user
  validates :content, presence: true, length: { maximum: 140 }, unless: proc { image.attached? }

  has_many :retweets, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :favorites, dependent: :destroy
  has_many_attached :image

  def favorited_by?(user)
    favorites.exists?(user_id: user.id)
  end
  
end
