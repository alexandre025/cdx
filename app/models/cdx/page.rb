module Cdx
  class Page < ApplicationRecord
    include Cdx::Resourceable
    include Cdx::Publishable
    include Cdx::SeoSupport

    extend FriendlyId

    translates :title, :slug, :content
    friendly_id :title, use: :json_translate

    # Validators
    validates :title, :state, presence: true

    # Methods
    def content_header_title
      title
    end
  end
end
