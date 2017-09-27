module Cdx
  module ImageAsset
    extend ActiveSupport::Concern

    included do
      validates_attachment :attachment, content_type: { content_type: Cdx::Asset::IMAGE_CONTENT_TYPE }
    end
  end
end