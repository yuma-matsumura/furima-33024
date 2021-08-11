class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

         validates: nickname, presence: true
         validates: email, uniqueness: true
         VALID_PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]+\z/i.freeze
         validates: password, format: { with: VALID_PASSWORD_REGEX}

         
         VALID_NAME_REGEX = /\A[ぁ-んァ-ヶ一-龥々ー]+\z/i.freeze
         validates: family_name, presence: true ,format: {with: VALID_NAME_REGEX}
         validates: first_name, presence: true ,format: {with: VALID_NAME_REGEX}
         
         VALID_NAME_KANA_REGEX = /\A[ァ-ヶ]+\z/i.freeze
         validates: family_name_kana, presence: true ,format: {VALID_NAME_KANA_REGEX}
         validates: first_name_kana, presence: true ,format: {VALID_NAME_KANA_REGEX}
         validates: birthday, presence: true 

end

