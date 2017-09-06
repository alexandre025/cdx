module Cdx
  class Page < ApplicationRecord
    include Cdx::Admin::Resourceable
    include Cdx::Admin::Publishable
    include Cdx::Admin::Taxonomisable::Simple

    extend FriendlyId

    translates :title, :slug, :content
    friendly_id :title, use: :hstore

    # Validators
    validates :title, :state, presence: true

    # Methods
    def content_header_title
      title
    end

    # def should_generate_new_friendly_id?
    #   title_changed?
    # end
  end
end
