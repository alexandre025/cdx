FactoryGirl.define do
  factory :cdx_setting, class: 'Cdx::Setting' do
    acronym 'CDX'
    default_theme 'yellow'
    default_locale 'en'
    available_locales %w(fr es)

    trait :wrong_attributes do
      acronym ''
      default_theme ''
      default_locale ''
      available_locales ''
    end
  end
end
