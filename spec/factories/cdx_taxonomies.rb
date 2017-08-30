FactoryGirl.define do
  factory :cdx_taxonomy, class: 'Cdx::Taxonomy' do
    name { Faker::Lorem.word }
    description { Faker::Lorem.sentence }

    after(:create) do |taxonomy|
      create_list(:cdx_taxon, 5, taxonomy: taxonomy, parent: taxonomy.root)
    end
  end
end
