class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  
  with_options presence: true, format: {with: /\A[ぁ-ゔァ-ヴ\p{Ideographic}ａ-ｚＡ-Ｚ０-９]+\z/} do
    validates :last_name
    validates :first_name
  end
  with_options presence: true, format: {with: /[\p{katakana} ー－&&[^ -~｡-ﾟ]]+/} do
    validates :last_name_ruby, presence: true
    validates :first_name_ruby, presence: true
  end
  validates :nickname, presence: true
  validates :birthday, presence: true
end
