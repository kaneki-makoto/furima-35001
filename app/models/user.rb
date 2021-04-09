class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :nickname, :kanji_last_name, :kanji_fist_name, :kana_last_name, :kana_fist_name, :birthday, presence: true
  has_many :items
end
