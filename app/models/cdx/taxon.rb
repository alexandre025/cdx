module Cdx
  class Taxon < ApplicationRecord
    # Associations
    belongs_to :taxonomy

    has_many :children, class_name: "Taxon", foreign_key: "parent_id"
    belongs_to :parent, class_name: "Taxon", optional: true

    # Methods
    def content_header_title
      name
    end
  end
end
