FactoryGirl.define do
  factory :cdx_taxon, class: 'Cdx::Taxon' do
    name { Faker::Lorem.word }
    description { Faker::Lorem.sentence }
    association :taxonomy, factory: :cdx_taxonomy
  end
end
