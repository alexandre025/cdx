FactoryGirl.define do
  factory :cdx_taxonomy, class: 'Cdx::Taxonomy' do
    name { Faker::Lorem.word }
    description { Faker::Lorem.sentence }
  end
end
