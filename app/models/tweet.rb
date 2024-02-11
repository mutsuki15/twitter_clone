# frozen_string_literal: true

class Tweet < ApplicationRecord
  belongs_to :user
  validates :content, presence: true

  has_many :retweets, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :favorites, dependent: :destroy
end
