# frozen_string_literal: true

class RetweetsController < ApplicationController
  def create
    tweet = Tweet.find(params[:tweet_id])
    retweet = current_user.retweets.new(tweet_id: tweet.id)
    retweet.save
    redirect_to request.referer, notice: 'リツイートをしました。'
  end

  def destroy
    tweet = Tweet.find(params[:tweet_id])
    retweet = current_user.retweets.find_by(tweet_id: tweet.id)
    retweet.destroy
    redirect_to request.referer, notice: 'リツイートを削除しました。'
  end
end
