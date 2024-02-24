# frozen_string_literal: true

class NotificationsController < ApplicationController
  def index
    @user = current_user
    @notifications = current_user.notifications.order(created_at: :desc).page(params[:page]).per(20)
    @notifications.where(checked: false).each do |notification|
      notification.update(checked: true)
    end
  end
end
