module Cdx
  class Site < ApplicationRecord
    include Cdx::Admin::ResourceRecord

    # Callbacks
    before_save { Cdx::Site.where.not(id: id).update_all(is_default: false) if is_default }

    # Validators
    validates :name, :domain, presence: true

    # Methods
    def content_header_title
      name
    end
  end
end
