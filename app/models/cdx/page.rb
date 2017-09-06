module Cdx
  class Page < ApplicationRecord
    include Cdx::Admin::Resourceable
    include Cdx::Admin::Publishable
    include Cdx::Admin::Taxonomisable::Simple

    translates :title, :slug, :content
    globalize_accessors

    extend FriendlyId
    friendly_id :title, use: :globalize

    # Validators
    validates :title, :state, presence: true

    # Methods
    def content_header_title
      title
    end

    # def should_generate_new_friendly_id?
    #  title_changed?
    # end
  end
end
