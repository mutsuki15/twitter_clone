# frozen_string_literal: true

class BookmarksController < ApplicationController
  def create
    tweet = Tweet.find(params[:tweet_id])
    bookmark = current_user.bookmarks.new(tweet_id: tweet.id)
    bookmark.save
    redirect_to request.referer, notice: 'ブックマークをしました。'
  end

  def destroy
    tweet = Tweet.find(params[:tweet_id])
    bookmark = current_user.bookmarks.find_by(tweet_id: tweet.id)
    bookmark.destroy
    redirect_to request.referer, notice: 'ブックマークを解除しました。'
  end
end
