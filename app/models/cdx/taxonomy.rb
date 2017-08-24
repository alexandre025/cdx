module Cdx
  class Taxonomy < ApplicationRecord
    include Cdx::Admin::Resourceable

    # Associations
    has_many :taxons, dependent: :destroy

    has_one :root, -> { where parent_id: nil }, class_name: 'Cdx::Taxon', dependent: :destroy

    after_create :set_root

    # Validators
    validates :name, presence: true

    # Methods
    def content_header_title
      name
    end

    private

      def set_root
        self.root ||= Taxon.create!(taxonomy_id: id, name: name)
      end
  end
end
