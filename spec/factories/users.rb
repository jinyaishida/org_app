FactoryBot.define do
  factory :user do
    nickname              {Faker::Name.initials(number: 2)}
    email                 {Faker::Internet.free_email}
    password              { '1a' + Faker::Internet.password(min_length: 6) }
    password_confirmation {password}
    first_name            {"じじ"}
    last_name             {"じじ"}
    first_name_kana       {"ジジ"}
    last_name_kana        {"ジジ"}
    birthday              {Faker::Date.birthday}
  end
end