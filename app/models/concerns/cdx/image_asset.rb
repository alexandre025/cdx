module Cdx
  module ImageAsset
    extend ActiveSupport::Concern

    included do
      validates_attachment :file, content_type: { content_type: %w(image/jpeg image/jpg image/png image/gif) }
    end
  end
end