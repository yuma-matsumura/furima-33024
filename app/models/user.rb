class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  # validates :nickname, presence: true
  validates :email, uniqueness: true
  VALID_PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]+\z/i.freeze
  validates :password, format: { with: VALID_PASSWORD_REGEX}


  VALID_NAME_REGEX = /\A[ぁ-んァ-ヶ一-龥々ー]+\z/i.freeze
  with_options presence: true,format: {with: VALID_NAME_REGEX} do
    validates :family_name
    validates :first_name
  end

  VALID_NAME_KANA_REGEX = /\A[ァ-ヶ]+\z/i.freeze
  with_options presence: true,format: {with: VALID_NAME_KANA_REGEX} do
    validates :family_name_kana
    validates :first_name_kana
  end

  with_options presence: true do
    validates :nickname
    validates :birthday
  end
end

