module Cdx
  module Admin
    module Taxonomisable
      # Add this concern when you want to link one or multiple

      module Simple
        extend ActiveSupport::Concern

        included do
          has_one :taxon_object, as: :object, dependent: :destroy
          has_one :taxon, through: :taxon_object
          has_one :taxonomy, through: :taxon

          accepts_nested_attributes_for :taxon_object
        end
      end

      module Multiple
        extend ActiveSupport::Concern

        included do
          has_many :taxon_objects, as: :object, dependent: :destroy
          has_many :taxons, through: :taxon_objects
          has_many :taxonomies, through: :taxons

          accepts_nested_attributes_for :taxon_objects
        end
      end
    end
  end
end