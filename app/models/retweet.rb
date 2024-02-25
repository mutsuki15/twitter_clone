# frozen_string_literal: true

class Retweet < ApplicationRecord
  belongs_to :user
  belongs_to :tweet

  has_one :notification, as: :subject, dependent: :destroy

  after_create_commit :create_notifications

  private

  def create_notifications
    Notification.create(subject: self, user: tweet.user, action_type: :retweeted_to_own_tweet)
    NotificationMailer.retweet_notification(self).deliver_now
  end
end
