# frozen_string_literal: true

class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :confirmable,
         :omniauthable, omniauth_providers: %i[github]
  
  validates :email, presence: true, uniqueness: true
  validates :uid, uniqueness: { scope: :provider }

  def self.from_omniauth(auth)
    where(provider: auth.provider, uid: auth.uid).first_or_create! do |user|
      user.name = auth.info.name
      user.email = auth.info.email || "default@example.com"
      user.phone_number = auth.info.phone_number || "09012345678"
      user.date_of_birth = auth.info.date_of_birth || "2000-01-01" 
      user.password = Devise.friendly_token[0, 20]
      user.skip_confirmation!
    end
  end
  
  def self.create_unique_string
    SecureRandom.uuid
  end

end
