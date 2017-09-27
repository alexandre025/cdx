module Cdx
  module Resourceable
    extend ActiveSupport::Concern

    def content_header_title
      title_was
    end
  end
end
