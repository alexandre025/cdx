module Cdx
  module Admin
    class TaxonsController < ResourceController
      before_action :load_taxonomy

      private

      def load_taxonomy
        @taxonomy = Cdx::Taxonomy.find(params[:taxonomy_id])
      end
    end
  end
end
