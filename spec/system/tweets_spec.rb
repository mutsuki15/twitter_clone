# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Tweets', type: :system do
  describe 'ツイート' do
    let(:user) { create(:user) }

    before do
      user.confirm
      sign_in user
    end

    context '正常系' do
      it 'ツイート' do
        content = 'test'

        expect do
          visit root_path
          fill_in 'tweet[content]', with: content
          find('input.tweet_button').click
        end.to change(user.tweets, :count).by 1

        expect(page).to have_content content
      end
    end

    context '異常系' do
      it '空欄での投稿' do
        expect do
          visit root_path
          fill_in 'tweet[content]', with: ''
          find('input.tweet_button').click
        end.not_to change(user.tweets, :count)

        expect(page).to have_content 'ツイートまたは画像がありません。'
      end
    end
  end
end
