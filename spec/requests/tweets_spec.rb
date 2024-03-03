# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Tweets', type: :request do
  describe 'ツイート' do
    context 'パラメータが正常な時' do
      let(:user) { create(:user) }
      let(:tweet_params) { { content: 'test' } }

      before do
        user.confirm
        sign_in user
      end

      it 'ツイートが作成される' do
        expect do
          post tweets_path, params: { tweet: tweet_params }
        end.to change(user.tweets, :count).by 1
      end

      it 'tweets_pathにリダイレクトされる' do
        post tweets_path, params: { tweet: tweet_params }
        expect(response).to redirect_to tweets_path
      end
    end

    context 'パラメータが異常な時' do
      let(:user) { create(:user) }
      let(:tweet_params) { { content: '' } }

      before do
        user.confirm
        sign_in user
      end

      it 'ツイートが作成されない' do
        expect do
          post tweets_path, params: { tweet: tweet_params }
        end.not_to change(user.tweets, :count)
      end

      it 'エラーメッセージが表示される' do
        post tweets_path, params: { tweet: { content: '' } }
        expect(response).to redirect_to(tweets_path)
        follow_redirect!
        expect(response.body).to include 'ツイートまたは画像がありません。'
      end
    end
  end
end
