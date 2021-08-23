class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :nickname, presence: true

  VALID_PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]+\z/i.freeze
  with_options format: { with: VALID_PASSWORD_REGEX } do
    validates :password
  end

  VALID_NAME_REGEX = /\A[ぁ-んァ-ヶ一-龥々ー]+\z/i.freeze
  with_options presence: true, format: { with: VALID_NAME_REGEX } do
    validates :family_name
    validates :first_name
  end

  VALID_NAME_KANA_REGEX = /\A[ァ-ヶ一]+\z/i.freeze
  with_options presence: true, format: { with: VALID_NAME_KANA_REGEX } do
    validates :family_name_kana
    validates :first_name_kana
  end
  validates :birthday, presence: true

  has_many :items
end
