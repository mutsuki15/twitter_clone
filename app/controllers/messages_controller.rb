# frozen_string_literal: true

class MessagesController < ApplicationController
  def index
    @user = current_user
    @message = Message.new
    @room = Room.find(params[:room_id])
    @selected_room = @room
    @messages = @room.messages.includes(:user)
  end

  def create
    @room = Room.find(params[:room_id])
    @message = @room.messages.new(message_params)
    if @message.save
      redirect_to room_messages_path(@room)
    else
      @messages = @room.messages.includes(:user)
      render :index
    end
  end

  private

  def message_params
    params.require(:message).permit(:content).merge(user_id: current_user.id)
  end
end
