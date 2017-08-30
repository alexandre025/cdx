FactoryGirl.define do
  factory :cdx_page, class: 'Cdx::Page' do
    title { Faker::Lorem.sentence }
    content { Faker::Lorem.paragraphs.join(' ') }
    association :taxon, factory: :cdx_taxon
  end
end
