# frozen_string_literal: true

class NotificationMailer < ApplicationMailer
  def retweet_notification(retweet)
    @retweet = retweet
    @user = retweet.tweet.user
    mail(to: @user.email, subject: 'リツイート通知')
  end

  def favorite_notification(favorite)
    @favorite = favorite
    @user = favorite.tweet.user
    mail(to: @user.email, subject: 'いいね通知')
  end

  def follow_notification(user)
    @user = user
    mail(to: @user.email, subject: 'フォロー通知')
  end

  def comment_notification(comment)
    @comment = comment
    @user = comment.tweet.user
    mail(to: @user.email, subject: '返信通知')
  end
end
