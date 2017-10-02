module Cdx
  module SeoSupport
    extend ActiveSupport::Concern

    included do
      has_one :seo, as: :record, dependent: :destroy
      accepts_nested_attributes_for :seo, reject_if: :all_blank
    end

  end
end