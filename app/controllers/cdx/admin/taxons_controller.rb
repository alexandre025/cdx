module Cdx
  module Admin
    class TaxonsController < ResourceController
      belongs_to 'cdx/taxonomy'

      before_action :available_parent_taxons, only: [:new, :edit]

      def index
        respond_to do |format|
          format.json do
            @collection = @collection.where(depth: 0).includes(:children)
          end
          format.html
        end
      end

      def update_position

      end

      private

      def available_parent_taxons
        @available_parent_taxons = @object.new_record? ? Cdx::Taxon.by_taxonomy(@parent) : Cdx::Taxon.by_taxonomy(@parent).where.not(id: @object.children.ids.push(@object.id))
      end

    end
  end
end
