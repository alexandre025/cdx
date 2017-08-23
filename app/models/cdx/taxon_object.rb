module Cdx
  class TaxonObject < ApplicationRecord

    belongs_to :taxon
    belongs_to :taxonomisable, polymorphic: true

    delegate :taxonomy, to: :taxon

  end
end