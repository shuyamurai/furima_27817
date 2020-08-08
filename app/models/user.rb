class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :email, presence: true, uniqueness: true 
  validates :password, presence: true, format: { with: /\A(?=.*?[a-z])(?=.*?\d)[\w-]{6,128}+\z/i, message: "Password Include both letters and numbers" }
  validates :nickname, presence: true
  validates :first_name, presence: true, format: { with: /\A[ぁ-んァ-ン一-龥]/, message: "Full-width characters" }
  validates :family_name, presence: true, format: { with: /\A[ぁ-んァ-ン一-龥]/, message: "Full-width characters" }
  validates :first_name_kana, presence: true, format: { with: /\A[ァ-ヶー－]+\z/, message: "Full-width characters"}
  validates :family_name_kana, presence: true, format: { with: /\A[ァ-ヶー－]+\z/, message: "Full-width characters"}
  validates :birthday, presence: true

end

