class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :items

  VALID_PASSWORD = /\A[a-z0-9]+\z/i
  VALID_NAME = /\A[ぁ-んァ-ン一-龥]/
  VALID_NAME_KANA = /\A[ァ-ヶー－]+\z/

  validates :nickname, :email, :password, :family_name, :first_name, :family_name_kana,
            :first_name_kana, :birth_year, :birth_month, :birth_day, presence: true
  validates :email, uniqueness: true, inclusion: { in: %w(@) }
  validates :password, length: { minimum: 6 }, format: { with: VALID_PASSWORD }, confirmation: true
  validates :password_confirmation, presence: true
  validates :family_name, :first_name, format: { with: VALID_NAME }
  validates :family_name_kana, :first_name_kana, format: { with: VALID_NAME_KANA }
  
end
