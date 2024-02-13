# frozen_string_literal: true

class TweetsController < ApplicationController
  def index
    return if current_user.blank?

    @tweets = Tweet.all.order(created_at: 'DESC').page(params[:page]).per(5)
    @user = current_user
    following_user_id = @user.following_user.ids
    @follower_tweets = Tweet.where(user_id: following_user_id).order(created_at: 'DESC').page(params[:page]).per(5)
  end
end
