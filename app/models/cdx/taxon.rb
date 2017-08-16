module Cdx
  class Taxon < ApplicationRecord
    acts_as_nested_set

    # Associations
    belongs_to :taxonomy

    # Scopes
    scope :by_taxonomy, -> (taxonomy) { where(taxonomy: taxonomy) }

    # Methods
    def content_header_title
      name
    end
  end
end
