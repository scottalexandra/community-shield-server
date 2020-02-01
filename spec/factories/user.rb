FactoryBot.define do
  factory :user do |i|
    first_name { "Alex" }
    last_name { "Robinson" }
    email { "alex_#{i}@example.com" }
    password { "password" }
    password_confirmation { "password" }
  end
end
