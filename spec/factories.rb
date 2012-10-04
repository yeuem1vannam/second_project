FactoryGirl.define do
  factory :user do
    username  "example"
    name      "Example Name"
    email     "user@example.com"
    password  "123456"
    password_confirmation "123456"
  end
end
