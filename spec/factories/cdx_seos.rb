FactoryGirl.define do
  factory :cdx_seo, class: 'Cdx::Seo' do
    association :record, factory: :cdx_page
    meta_title { Faker::App.name }
    meta_keywords { Faker::Lorem.words }
    meta_description { Faker::Lorem.paragraph }
    meta_canonical { Faker::Internet.url }
    og_title { Faker::App.name }
    og_keywords { Faker::Lorem.words }
    og_description { Faker::Lorem.paragraph }
    og_video { Faker::Internet.url }
    association :og_image, factory: :cdx_asset, name: :og_image
  end
end
