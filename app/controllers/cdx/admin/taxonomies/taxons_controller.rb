module Cdx
  module Admin
    class Taxonomies::TaxonsController < BaseController
      before_action :load_taxonomy

      respond_to :json

      def index
        @collection = Taxon.by_taxonomy(@taxonomy).where(depth: 0).includes(:children)
      end

      def update_position

      end

      private

      def load_taxonomy
        @taxonomy ||= Taxonomy.find(params[:taxonomy_id])
      end

    end
  end
end
