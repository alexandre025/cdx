FactoryGirl.define do
  factory :cdx_user, class: 'Cdx::User' do
    email { Faker::Internet.email }
    password 'cdx123'
    first_name { Faker::Name.first_name }
    last_name { Faker::Name.last_name }

    trait :admin do
      roles Cdx::User::ROLES
    end
  end
end
