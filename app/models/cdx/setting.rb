module Cdx
  class Setting < ApplicationRecord

    # Associations

    has_one :seo, as: :record, dependent: :destroy
    accepts_nested_attributes_for :seo, reject_if: :all_blank

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
