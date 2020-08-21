class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
        with_options  presence: true do
          validates :password, format: { with: /\A[a-zA-Z0-9]+\z/}
          validates :nickname, :l_name, :f_name, :l_name_kana, :f_name_kana, :birthday
          validates :l_name, :f_name, format: { with: /\A[ぁ-んァ-ン一-龥]/}
          validates :l_name_kana, :f_name_kana, format: { with: /\A[ァ-ヶー－]+\z/}
        end

end
