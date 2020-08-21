FactoryBot.define do
  factory :user do
    nickname              {"abe"}
    email                 {"kkk@gmail.com"}
    password              {"00000000"}
    password_confirmation {password}
    l_name                {"山田"}
    f_name                {"太郎"}
    l_mane_kana           {"ヤマダ"}
    f_mane_kana           {"タロウ"}
    birthday              {"00000000"}
  end
end