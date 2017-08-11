module Cdx
  class Taxonomy < ApplicationRecord
    include Cdx::Admin::ResourceRecord

    # Associations
    has_many :taxons

    # Validators
    validates :name, presence: true

    # Methods
    def content_header_title
      name
    end
  end
end
