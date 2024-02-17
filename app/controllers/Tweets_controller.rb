# frozen_string_literal: true

class TweetsController < ApplicationController
  def index
    return if current_user.blank?

    @tweets = Tweet.all.order(created_at: 'DESC').page(params[:page]).per(5)
    @user = current_user
    following_user_id = @user.following_user.ids
    @follower_tweets = Tweet.where(user_id: following_user_id).order(created_at: 'DESC').page(params[:page]).per(5)
  end

  def new
    @tweet = Tweet.new
  end

  def create
    tweet = current_user.tweets.build(tweet_params)
    if tweet.save
      redirect_to tweets_path, notice: 'ツイートを作成しました。'
    elsif tweet.content == ''
      redirect_to tweets_path, alert: 'ツイートまたは画像がありません。'
    else
      redirect_to tweets_path, alert: 'ツイートの投稿に失敗しました。'
    end
  end

  def show
    return if current_user.blank?

    @tweets = Tweet.all.order(created_at: 'DESC').page(params[:page]).per(5)
    @tweet = Tweet.find(params[:id])
    @comment = Comment.new
    @user = current_user
    @favorites = @user.favorites.order(created_at: 'DESC')
    @retweets = @user.retweets.order(created_at: 'DESC')
    @comments = @user.comments.order(created_at: 'DESC')
    @following_user = @user.following_user.ids
    @follower_user = @user.follower_user.ids
  end

  private

  def tweet_params
    params.require(:tweet).permit(:content, image: [])
  end
end
