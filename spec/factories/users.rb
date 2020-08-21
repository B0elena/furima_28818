FactoryBot.define do
  factory :user do
    nickname              {"abe"}
    email                 {"kkk@gmail.com"}
    password              {"00000000"}
    password_confirmation {password}
    l_name                {"suga"}
    f_name                {"tatsunori"}
    l_name_kana           {"suga"}
    f_name_kana           {"tatsunori"}
    birthday              {"1990-10-12"}
  end
end