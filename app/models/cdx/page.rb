module Cdx
  class Page < ApplicationRecord
    include Cdx::Admin::ResourceRecord

    ### Validators
    validates :name, presence: true

    ### Methods
    def content_header_title
      name
    end
  end
end
