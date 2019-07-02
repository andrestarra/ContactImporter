FactoryBot.define do
  factory :contact do
    name { "MyString" }
    birthdate { "2019-07-02" }
    phone_number { "MyString" }
    address { "MyString" }
    credit_card { "MyString" }
    franchise { "MyString" }
    email { "MyString" }
    user { nil }
  end
end
