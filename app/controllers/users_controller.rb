# frozen_string_literal: true

class UsersController < ApplicationController
  before_action :set_user, only: %i[show edit update]

  def show
    @tweets = @user.tweets.order(created_at: 'DESC')
    @favorites = @user.favorites.order(created_at: 'DESC')
    @retweets = @user.retweets.order(created_at: 'DESC')
    @comments = @user.comments.order(created_at: 'DESC')
    @following_user = @user.following_user.ids
    @follower_user = @user.follower_user.ids
  end

  def edit; end

  def update
    if @user.update(user_params)
      flash[:notice] = 'プロフィールを編集しました。'
      redirect_to user_path(@user)
    else
      flash[:alert] = '入力内容に不備があります。'
      render :edit
    end
  end

  private

  def set_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:name, :custom_user_id, :avatar, :header, :profile, :location, :web_site,
                                 :date_of_birth)
  end
end
