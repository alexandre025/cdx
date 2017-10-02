module Cdx
  class Taxonomy < ApplicationRecord
    include Cdx::Resourceable

    # Scopes
    scope :available_for, -> (code) { where('available_codes ? :code', code: code).or(where('available_codes = ? OR available_codes IS NULL', '[""]')).order(:name) }

    # Callbacks
    after_create :set_root

    # Associations
    has_many :taxons, -> { order('name ASC') }, dependent: :destroy
    has_one :root, -> { where parent_id: nil }, class_name: 'Cdx::Taxon', dependent: :destroy

    # Validators
    validates :name, presence: true

    # Constants
    AVAILABLE_CODES = Cdx.taxonomy_available_codes.freeze

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
