FactoryBot.define do
  factory :user do
    nickname              {"daiki"}
    email                 {"test@mail.com"}
    password              {"0000000"}
    password_confirmation {"0000000"}
    last_name             {"遠藤"}
    first_name            {"大樹"}
    last_name_ruby        {"エンドウ"}
    first_name_ruby       {"ダイキ"}
    birthday              {2021_09_25}
  end
end