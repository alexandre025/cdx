FactoryGirl.define do
  factory :cdx_site, class: 'Cdx::Site' do
    name { Faker::App.name }
    code { Faker::Internet.slug }
    domain { Faker::Internet.domain_name }
    default false
  end
end
