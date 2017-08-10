module Cdx
  class Site < ApplicationRecord
    include Cdx::Admin::ResourceRecord
    store :settings, accessors: [], coder: JSON

    ### Validators
    validates :name, presence: true

    ### Methods
    def content_header_title
      name
    end
  end
end
