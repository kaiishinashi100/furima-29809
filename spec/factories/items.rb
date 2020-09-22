FactoryBot.define do
  factory :item do
    name                        { Faker::Name.initials(number: 2) }
    genre_id                    { 2 }
    place                       { 1000 }
    explanation                 { Faker::Name.initials(number: 10) }
    status_id                   { 2 }
    delivery_fee_id             { 2 }
    shipment_source_id          { 2 }
    delivery_completion_date_id { 2 }
  end
end
