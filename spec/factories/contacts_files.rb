FactoryBot.define do
  factory :contacts_file do
    csv_file { "MyString" }
    state { "MyString" }
    user { nil }
  end
end
