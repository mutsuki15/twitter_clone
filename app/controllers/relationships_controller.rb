# frozen_string_literal: true

class RelationshipsController < ApplicationController
  def create
    user = User.find(params[:user_id])
    current_user.follow(user)
    redirect_to request.referer, notice: 'フォローしました。'
  end

  def destroy
    user = User.find(params[:user_id])
    current_user.unfollow(user)
    redirect_to request.referer, notice: 'フォローを解除しました。'
  end
end
