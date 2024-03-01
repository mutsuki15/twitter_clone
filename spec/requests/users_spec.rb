require 'rails_helper'

RSpec.describe "Users", type: :request do
  describe "サインアップ" do
    let(:user) { create(:user) }
    let(:user_params) { attributes_for(:user) }
    let(:invalid_user_params) { attributes_for(:user, name: '') }

    context 'パラメータが正常な時' do
      it 'requestが成功すること' do
        post user_registration_path, params: { user: user_params }
        expect(response).to have_http_status(:see_other)
      end

      it '認証メールが送信される' do
        post user_registration_path, params: { user: user_params }
        expect(ActionMailer::Base.deliveries.size).to eq 1
      end

      it 'ユーザの登録に成功する' do
        expect do
          post user_registration_path, params: { user: user_params }
        end.to change(User, :count).by 1
      end

      it 'root_pathにリダイレクトされる' do
        post user_registration_path, params: { user: user_params }
        expect(response).to redirect_to root_url
      end
    end

    context 'パラメータが異常な時' do
      it 'requestが成功すること' do
        post user_registration_path, params: { user: user_params }
        expect(response).to have_http_status(:see_other)
      end

      it 'ユーザの登録に失敗する' do
        expect do
          post user_registration_path, params: { user: invalid_user_params }
        end.not_to change(User, :count)
      end

      it 'エラーメッセージが表示される' do
        post user_registration_path, params: { user: invalid_user_params }
        expect(response.body).to include 'を入力してください'
      end
    end
  end

  describe 'ログイン' do
    context 'パラメータが正常のとき' do
      let(:user) { create(:user) }
      let(:user_params) { { email: user.email, password: user.password } }

      before do
        user.confirm
      end

      it 'ログインが成功する' do
        post user_session_path, params: { user: user_params }
        expect(response).to have_http_status(:see_other)
      end

      it 'ログイン状態になる' do
        post user_session_path, params: { user: user_params }
        expect(controller.user_signed_in?).to be true
      end

      it 'root_pathにリダイレクトされる' do
        post user_session_path, params: { user: user_params }
        expect(response).to redirect_to root_url
      end
    end

    context 'パラメータが異常のとき' do
      let(:user) { create(:user) }
      let(:invalid_user_params) { { email: user.email, password: 'invalid' } }

      before do
        user.confirm
      end

      it 'ログインが失敗する' do
        post user_session_path, params: { user: invalid_user_params }
        expect(response).to have_http_status(:unprocessable_entity)
      end

      it 'ログイン状態にならない' do
        post user_session_path, params: { user: invalid_user_params }
        expect(controller.user_signed_in?).to be false
      end
    end
  end
end