FactoryBot.define do
  factory :user do
    name { "Tarou" }
    email { "test@example.com" }
    password { "xxxxxxx" }
    country { true }
  end
end
