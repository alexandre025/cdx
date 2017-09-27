module Cdx
  class Asset < ApplicationRecord
    has_many :attachments, dependent: :destroy

    IMAGE_CONTENT_TYPE = %w(image/jpeg image/jpg image/png image/gif).freeze

    def image?
      IMAGE_CONTENT_TYPE.include? attachment_content_type
    end
  end
end
