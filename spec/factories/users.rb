FactoryBot.define do
  factory :user do
    username { Faker::Name.initials(number: 10) }
		email { Faker::Internet.email }
		password { '123456' }
		role { 1 }
  end
end