module Cdx
  class Site < ApplicationRecord
    include Cdx::Admin::ResourceRecord

    # Callbacks
    before_save { Cdx::Site.where.not(id: id).update_all(default: false) if default }

    # Validators
    validates :name, :domain, presence: true
    validate  :must_have_one_default_site

    # Methods
    def content_header_title
      name
    end

    private

    def must_have_one_default_site
      if !default && !Cdx::Site.where.not(id: id).exists?(default: true)
        errors.add(:default, I18n.t('admin.custom_validators.must_have_one_default_site'))
      end
    end
  end
end
