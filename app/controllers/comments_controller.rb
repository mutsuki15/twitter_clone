# frozen_string_literal: true

class CommentsController < ApplicationController
  def create
    @tweet = Tweet.find(params[:tweet_id])
    @comment = current_user.comments.build(comment_params)
    @comment.tweet_id = @tweet.id
    if @comment.save
      redirect_to tweet_path(@tweet), notice: 'コメントを投稿しました。'
    elsif @comment.content == ''
      Rails.logger.debug @comment.errors.full_messages
      redirect_to tweet_path(@tweet), alert: 'コメントまたは画像がありません。'
    else
      redirect_to tweet_path(@tweet), alert: 'コメントの投稿に失敗しました。'
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:content, image: [])
  end
end
