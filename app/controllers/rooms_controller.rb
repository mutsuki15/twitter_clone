# frozen_string_literal: true

class RoomsController < ApplicationController
  def index
    @room = Room.all
    @user = current_user
  end

  def create
    user_ids = params[:user_ids]
    @room = Room.joins(:users)
                .where(users: { id: user_ids })
                .group('rooms.id')
                .having('COUNT(rooms.id) = ?', user_ids.size)
                .first
    if @room.nil?
      @room = Room.new(room_params)
      @room.save
    end
    redirect_to room_messages_path(@room)
  end

  private

  def room_params
    params.permit(user_ids: [])
  end
end
