# frozen_string_literal: true

class Favorite < ApplicationRecord
  belongs_to :user
  belongs_to :tweet

  has_one :notification, as: :subject, dependent: :destroy

  after_create_commit :create_notifications

  private

  def create_notifications
    Notification.create(subject: self, user: tweet.user, action_type: :liked_to_own_tweet)
    NotificationMailer.favorite_notification(self).deliver_now
  end
end
