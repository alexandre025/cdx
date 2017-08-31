FactoryGirl.define do
  factory :cdx_setting, class: 'Cdx::Setting' do
    acronym 'CDX'
    default_theme 'yellow'
    default_locale 'en'
    available_locales %w(en fr)
  end
end
