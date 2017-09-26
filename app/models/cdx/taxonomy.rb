module Cdx
  class Taxonomy < ApplicationRecord
    include Cdx::Admin::Resourceable

    # Callbacks
    after_create :set_root

    # Associations
    has_many :taxons, dependent: :destroy
    has_one :root, -> { where parent_id: nil }, class_name: 'Cdx::Taxon', dependent: :destroy

    # Validators
    validates :name, presence: true

    # Constants
    AVAILABLE_CODES = %w(pages)

    # Methods
    def content_header_title
      name_was
    end

    private

      def set_root
        self.root ||= Taxon.create!(taxonomy_id: id, name: name)
      end
  end
end
