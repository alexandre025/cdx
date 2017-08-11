module Cdx
  class Page < ApplicationRecord
    include Cdx::Admin::ResourceRecord
    include Cdx::Admin::PublishableRecord

    extend FriendlyId
    friendly_id :title, use: :slugged

    # Validators
    validates :title, :state, presence: true

    # Methods
    def content_header_title
      title
    end

    def should_generate_new_friendly_id?
      title_changed?
    end

  end
end
