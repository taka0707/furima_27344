class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :items

  VALID_PASSWORD = /(?=.*?[a-z])(?=.*?\d)[a-z\d]/i.freeze
  VALID_NAME = /\A[ぁ-んァ-ン一-龥]/.freeze
  VALID_NAME_KANA = /\A[ァ-ヶー－]+\z/.freeze
  VALID_EMAIL = /[a-z\d]+@[a-z\d]+/i.freeze

  validates :nickname, :email, :password, :family_name, :first_name, :family_name_kana,
            :first_name_kana, :birth_date, presence: true
  validates :email, uniqueness: {case_sensitive: true}, format: { with: VALID_EMAIL }
  validates :password, length: { minimum: 6 }, format: { with: VALID_PASSWORD }, confirmation: true
  validates :password_confirmation, presence: true
  validates :family_name, :first_name, format: { with: VALID_NAME }
  validates :family_name_kana, :first_name_kana, format: { with: VALID_NAME_KANA }
end
