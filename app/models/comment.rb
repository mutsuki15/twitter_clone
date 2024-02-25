# frozen_string_literal: true

class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :tweet
  validates :content, presence: true, length: { maximum: 140 }, unless: proc { image.attached? }

  has_many :favorites, dependent: :destroy
  has_many :retweets, dependent: :destroy
  has_many_attached :image

  has_one :notification, as: :subject, dependent: :destroy

  after_create_commit :create_notifications

  private

  def create_notifications
    Notification.create(subject: self, user: tweet.user, action_type: :commented_to_own_tweet)
    NotificationMailer.comment_notification(self).deliver_now
  end
end
