FactoryGirl.define do
  factory :cdx_asset, class: 'Cdx::Asset' do
    name 'avatar'
    association :record, factory: :cdx_user
  end
end
