FactoryBot.define do
  factory :user do
    nickname              {"daiki"}
    email                 {"test@test.com"}
    password              {"000aaa"}
    password_confirmation {"000aaa"}
    last_name             {"遠藤"}
    first_name            {"大樹"}
    last_name_ruby        {"エンドウ"}
    first_name_ruby       {"ダイキ"}
    birthday              {"2021-09-25"}
  end
end