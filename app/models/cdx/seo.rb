module Cdx
  class Seo < ApplicationRecord
    belongs_to :record, polymorphic: true, optional: true

    # Assets
    has_one_attached :og_image, 'Asset::Seo::OgImage'

    store_accessor :meta, :meta_title, :meta_description, :meta_keywords, :meta_canonical
    store_accessor :og, :og_title, :og_description, :og_keywords, :og_video

    after_validation :normalize_blank_values

    def normalize_blank_values
      attributes['meta'].each do |column, value|
        self['meta'][column].present? || (self['meta'][column] = nil)
      end
      attributes['og'].each do |column, value|
        self['og'][column].present? || (self['og'][column] = nil)
      end
    end
  end
end
