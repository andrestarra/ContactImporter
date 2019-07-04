FactoryBot.define do
  factory :field_column do
    name { 1 }
    birthdate { 1 }
    phone_number { 1 }
    address { 1 }
    credit_card { 1 }
    email { 1 }
    contacts_file { nil }
  end
end
