module Cdx
  class TaxonObject < ApplicationRecord
    belongs_to :taxon
    belongs_to :object, polymorphic: true
  end
end
