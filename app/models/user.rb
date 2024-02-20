# frozen_string_literal: true

class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :confirmable,
         :omniauthable, omniauth_providers: %i[github]

  validates :email, presence: true, uniqueness: true
  validates :uid, uniqueness: { scope: :provider }
  validates :custom_user_id, presence: true, format: { with: /\A\w+\z/ }

  def self.from_omniauth(auth)
    where(provider: auth.provider, uid: auth.uid).first_or_create! do |user|
      user.name = auth.info.name
      user.email = auth.info.email || 'default@example.com'
      user.phone_number = auth.info.phone_number || '09012345678'
      user.date_of_birth = auth.info.date_of_birth || '2000-01-01'
      user.password = Devise.friendly_token[0, 20]
      user.skip_confirmation!
    end
  end

  def self.create_unique_string
    SecureRandom.uuid
  end

  def follow(user)
    follower.create(followed_id: user.id)
  end
  
  def unfollow(user)
    follower.find_by(followed_id: user.id).destroy
  end
  
  def following?(user)
    following_user.include?(user)
  end

  has_many :tweets, dependent: :destroy
  has_many :retweets, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :favorites, dependent: :destroy
  has_many :follower, class_name: 'Relationship', foreign_key: 'follower_id', dependent: :destroy, inverse_of: :follower
  has_many :followed, class_name: 'Relationship', foreign_key: 'followed_id', dependent: :destroy, inverse_of: :followed
  has_many :following_user, through: :follower, source: :followed
  has_many :follower_user, through: :followed, source: :follower
  has_one_attached :avatar
  has_one_attached :header
end
