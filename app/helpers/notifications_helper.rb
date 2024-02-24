# frozen_string_literal: true

module NotificationsHelper
  def transition_path(notification)
    case notification.action_type.to_sym
    when :commented_to_own_tweet
      tweet_path(notification.subject.tweet, anchor: "comment-#{notification.subject.id}")
    when :liked_to_own_tweet
      tweet_path(notification.subject.tweet)
    when :followed_me
      user_path(notification.subject.follower)
    when :retweeted_to_own_tweet
      tweet_path(notification.subject.tweet)
    end
  end
end
