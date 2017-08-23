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

    def full_path_tag
      parent_path_tag(parent, '')
    end

    def parent_path_tag(taxon, string)
      if taxon
        if string.blank?
          parent_path_tag(taxon.parent, "#{taxon.name}")
        else
          parent_path_tag(taxon.parent, "#{taxon.name} -> #{string}")
        end
      else
        "#{taxonomy.name} -> #{string}"
      end
    end
  end
end
