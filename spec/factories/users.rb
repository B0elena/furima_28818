FactoryBot.define do
  factory :user do
    nickname              {"elena"}
    email                 {"kkk@gmail.com"}
    password              {"1234abcd"}
    password_confirmation {password}
    l_name                {"漢字"}
    f_name                {"漢字"}
    l_name_kana           {"カナ"}
    f_name_kana           {"カナ"}
    birthday              {"1990-10-12"}
  end
end