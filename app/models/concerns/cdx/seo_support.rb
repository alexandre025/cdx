module Cdx
  module SeoSupport
    extend ActiveSupport::Concern

    included do
      has_one :seo, as: :record, dependent: :destroy
      accepts_nested_attributes_for :seo, reject_if: :all_blank

      delegate :meta_title,
               :meta_description,
               :meta_keywords,
               :meta_canonical,
               :og_title, :og_description,
               :og_keywords,
               :og_video,
               :og_image,
               to: :seo, allow_nil: true
    end

  end
end