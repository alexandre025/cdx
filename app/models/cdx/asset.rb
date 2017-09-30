module Cdx
  class Asset < ApplicationRecord
    belongs_to :record, polymorphic: true, optional: true

    IMAGE_CONTENT_TYPE = %w(image/jpeg image/jpg image/png image/gif).freeze

    def image?
      IMAGE_CONTENT_TYPE.include? attachment_content_type
    end
  end
end
