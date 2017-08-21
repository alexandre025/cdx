module Cdx
  module Admin
    class Taxonomies::TaxonsController < BaseController
      before_action :load_taxonomy

      before_action :load_taxon, only: [:update_position]

      respond_to :json

      def index
        @collection = Taxon.by_taxonomy(@taxonomy).where(depth: 0).includes(:children)
      end

      def update_position
        parent_id = params[:node][:parent] == '#' ? nil : params[:node][:parent]
        @taxon.update(parent_id: parent_id)
      end

      private

      def load_taxonomy
        @taxonomy ||= Taxonomy.find(params[:taxonomy_id])
      end

      def load_taxon
        @taxon ||= Taxon.find(params[:id])
      end

    end
  end
end
