FactoryBot.define do
  factory :user do
    first_name { "Alex" }
    last_name { "Robinson" }
    email { "alex@example.com" }
    password { "password" }
    password_confirmation { "password" }
  end
end
