# frozen_string_literal: true

class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    @tweets = @user.tweets.order(created_at: 'DESC')
    @favorites = @user.favorites.order(created_at: 'DESC')
    @retweets = @user.retweets.order(created_at: 'DESC')
    @comments = @user.comments.order(created_at: 'DESC')
    @following_user = @user.following_user.ids
    @follower_user = @user.follower_user.ids
  end
end
