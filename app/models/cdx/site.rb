module Cdx
  class Site < ApplicationRecord
    include Cdx::Admin::ResourceRecord

    # Callbacks
    before_save { Cdx::Site.where.not(id: id).update_all(is_default: false) if is_default }

    # Validators
    validates :name, :domain, presence: true
    validate  :must_have_one_default_site

    # Methods
    def content_header_title
      name
    end

    private

    def must_have_one_default_site
      if !is_default && !Cdx::Site.where.not(id: id).exists?(is_default: true)
        errors.add(:is_default, I18n.t('admin.custom_validators.must_have_one_default_site'))
      end
    end
  end
end
