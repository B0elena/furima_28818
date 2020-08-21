class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
         validates :nickname, :l_name, :f_name, :l_name_kana, :f_name_kana, :birthday, presence: true
         validates :l_name, :f_name, format: { with: /\A[ぁ-んァ-ン一-龥]/}
         validates :l_name_kana, :f_name_kana, format: { with: /\A[ァ-ヶー－]+\z/}

end
