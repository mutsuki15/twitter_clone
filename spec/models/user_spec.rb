# frozen_string_literal: true

require 'rails_helper'

RSpec.describe User, type: :model do
  it 'パラメータが正常な時' do
    expect(FactoryBot.build(:user)).to be_valid
  end

  it 'メールアドレスが空欄の時' do
    user = FactoryBot.build(:user, email: nil)
    expect(user).to be_invalid
  end

  it '名前が空欄の時' do
    user = FactoryBot.build(:user, name: nil)
    expect(user).to be_invalid
  end

  it 'パスワードが空欄の時' do
    user = FactoryBot.build(:user, password: nil)
    expect(user).to be_invalid
  end

  it '電話番号が空欄の時' do
    user = FactoryBot.build(:user, phone_number: nil)
    expect(user).to be_invalid
  end
end
