FactoryBot.define do
  factory :user do
    nickname                { Faker::Name.initials(number: 2) }
    email                   { Faker::Internet.free_email }
    password                { Faker::Internet.password(min_length: 6) }
    password_confirmation   { password }
    family_name_full_width  { 'いい' }
    first_name_full_width   { 'うう' }
    family_name_kana        { 'イイ' }
    first_name_kana         { 'ウウ' }
    birth_day { Faker::Date.between(from: '2014-09-23', to: '2014-09-25') }
  end
end
