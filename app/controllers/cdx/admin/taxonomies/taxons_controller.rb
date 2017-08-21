module Cdx
  module Admin
    class Taxonomies::TaxonsController < BaseController
      before_action :load_taxonomy

      before_action :load_taxon, only: [:update_position, :destroy]

      respond_to :json

      def index
        @collection = Taxon.by_taxonomy(@taxonomy).where(depth: 0).includes(:children)
      end

      def update_position
        if parent_from_params
          @taxon.move_to_child_with_index(Taxon.find(parent_from_params), params[:node][:position].to_i)
        else
          @taxon.move_to_root
          # TODO : Create a root taxon to allow first level taxons to be ordered
        end
      end

      def create_or_update
        @taxon = params[:node][:id].to_i.to_s == params[:node][:id] ? Taxon.find(params[:node][:id]) : Taxon.new(taxonomy: @taxonomy)

        @taxon.assign_attributes(parent_id: parent_from_params, name: params[:node][:text])

        if @taxon.save
          render json: @taxon
        else
          render json: { errors: @taxon.errors.full_messages }, status: 422
        end
      end

      def destroy
        if @taxon.destroy

        else
          render json: { errors: @taxon.errors.full_messages }, status: 422
        end
      end

      private

      def parent_from_params
        params[:node][:parent] == '#' ? nil : params[:node][:parent]
      end

      def load_taxonomy
        @taxonomy ||= Taxonomy.find(params[:taxonomy_id])
      end

      def load_taxon
        @taxon ||= Taxon.find(params[:id])
      end

    end
  end
end
