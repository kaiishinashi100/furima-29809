FactoryBot.define do
  factory :order do
    token { 'aaa' }
    postal_code { '123-4567' }
    prefecture_id { 2 }
    city       { 'aaa' }
    address    { 'aaa' }
    building   { 'aaa' }
    phone_number {'00099999999'}
  end
end
