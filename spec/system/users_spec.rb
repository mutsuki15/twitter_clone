# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Users', type: :system do
  describe 'サインアップ' do
    context '正常系' do
      let(:user) { build(:user) }

      scenario 'アカウント作成' do
        expect do
          visit new_user_registration_path
          fill_in 'user_name', with: user.name
          fill_in 'user_email', with: user.email
          fill_in 'user_phone_number', with: user.phone_number
          select user.date_of_birth.year.to_s, from: 'user_date_of_birth_1i'
          select user.date_of_birth.month.to_s, from: 'user_date_of_birth_2i'
          select user.date_of_birth.day.to_s, from: 'user_date_of_birth_3i'
          fill_in 'user_password', with: user.password
          fill_in 'user_password_confirmation', with: user.password
          click_button '作成'
        end.to change(User, :count).by 1

        expect(ActionMailer::Base.deliveries.size).to eq 1
        expect(page).to have_content 'アカウント認証用メールがあなたのメールアドレスに送信されました。アカウントを有効化するために、リンクをクリックしてください。'
      end
    end

    context '異常系' do
      let(:user) { build(:user) }
      let(:user2) { create(:user) }

      before do
        user2.confirm
      end

      scenario '登録済みのメールアドレスでのアカウント作成' do
        expect do
          visit new_user_registration_path
          fill_in 'user_name', with: user.name
          fill_in 'user_email', with: user2.email
          fill_in 'user_phone_number', with: user.phone_number
          select user.date_of_birth.year.to_s, from: 'user_date_of_birth_1i'
          select user.date_of_birth.month.to_s, from: 'user_date_of_birth_2i'
          select user.date_of_birth.day.to_s, from: 'user_date_of_birth_3i'
          fill_in 'user_password', with: user.password
          fill_in 'user_password_confirmation', with: user.password
          click_button '作成'
        end.to change(User, :count).by 0

        expect(page).to have_content 'すでに使用されています'
        expect(page).to have_content 'アカウントを作成'
      end
    end
  end

  describe 'ログイン' do
    let(:user) { create(:user) }

    before do
      user.confirm
    end

    context '正常系' do
      scenario 'ログイン' do
        visit new_user_session_path
        fill_in 'user_email', with: user.email
        fill_in 'user_password', with: user.password
        click_button 'ログイン'

        expect(page).to have_content 'サインインしました。'
        expect(page).to have_content user.name
        expect(page).to have_content 'ホーム'
      end
    end

    context '異常系' do
      scenario '空欄でのログイン' do
        visit new_user_session_path
        fill_in 'user_email', with: ''
        fill_in 'user_password', with: ''
        click_button 'ログイン'

        expect(page).to have_content "入力内容に不備があります。"
        expect(page).to have_content 'Xにログイン'
      end
    end
  end
end