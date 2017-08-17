module Cdx
  module Admin
    class TaxonomiesController < ResourceController
      protected

        def location_after_save
          admin_taxonomy_taxons_path(@object)
        end
    end
  end
end
