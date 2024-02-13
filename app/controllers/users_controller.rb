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

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      flash[:notice] = 'プロフィールを編集しました。'
      redirect_to user_path(@user.id)
    else
      flash[:alert] = '入力内容に不備があります。'
      render :edit
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :custom_user_id, :avatar, :header, :profile, :location, :web_site,
                                 :date_of_birth)
  end
end
