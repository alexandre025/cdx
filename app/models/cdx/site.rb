module Cdx
  class Site < ApplicationRecord
    include Cdx::Admin::Resourceable

    translates :name

    # Callbacks
    before_save { Cdx::Site.where.not(id: id).update_all(default: false) if default }

    # Validators
    validates :name, :code, :domain, presence: true
    validates :code, uniqueness: true
    validate :must_have_one_default_site

    # Scope
    scope :by_domain, -> (domain) { where('domain like ?', domain) }

    # Methods
    def content_header_title
      name
    end

    def self.current(domain = nil)
      current_site = domain ? Site.by_domain(domain).first : nil
      current_site || Site.default
    end

    def self.default
      Rails.cache.fetch('default_site') do
        where(default: true).first_or_initialize
      end
    end

    private

      def must_have_one_default_site
        if !default && !Cdx::Site.where.not(id: id).exists?(default: true)
          errors.add(:default, I18n.t('admin.custom_validators.must_have_one_default_site'))
        end
      end
  end
end
