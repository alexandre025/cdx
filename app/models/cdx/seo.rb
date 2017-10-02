module Cdx
  class Seo < ApplicationRecord

    belongs_to :record, polymorphic: true

    has_one :og_image, -> { where(name: :og_image) }, class_name: 'Asset::Seo::OgImage', as: :record, dependent: :destroy
    accepts_nested_attributes_for :og_image, allow_destroy: true

    store_accessor :meta, :meta_title, :meta_description, :meta_keywords, :meta_canonical
    store_accessor :og, :og_title, :og_description, :og_keywords, :og_video
  end
end
