FactoryGirl.define do
  factory :cdx_site, class: 'Cdx::Site' do
    name { Faker::App.name }
    code { Faker::Internet.slug }
    domain { Faker::Internet.domain_name }
    default true

    trait :wrong_attributes do
      name ''
      code ''
      domain ''
      default false
    end
  end
end
