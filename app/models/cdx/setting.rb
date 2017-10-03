module Cdx
  class Setting < ApplicationRecord
    include Cdx::SeoSupport

    # Validators

    validates :acronym, :default_theme, :default_locale, presence: true

    # Methods

    def acronym=(value)
      super(value.upcase)
    end

    def available_locales
      (super << default_locale).uniq
    end

    def self.current
      Setting.first_or_create(acronym: 'CDX', default_theme: 'yellow', default_locale: 'en', available_locales: %w(en fr es))
    end
  end
end
