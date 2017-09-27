FactoryGirl.define do
  factory :cdx_taxon_object, class: 'Cdx::TaxonObject' do
    association :taxon, factory: :cdx_taxon
    association :object, factory: :cdx_page
  end
end
