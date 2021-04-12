FactoryBot.define do
  factory :user do
    nickname              {Faker::Name.initials(number: 2)}
    email                 {Faker::Internet.free_email}
    password              {Faker::Internet.password(min_length: 6)}
    password_confirmation {password}
    kanji_last_name       {'あ会ア'}
    kanji_fist_name       {'い胃イ'}
    kana_last_name        {'アアア'}
    kana_fist_name        {'イイイ'}
    birthday              {'1984-10-18'}
  end
end
