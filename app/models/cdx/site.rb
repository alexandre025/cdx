module Cdx
  class Site < ApplicationRecord
    include Cdx::Admin::ResourceRecord

    ### Callbacks
    before_save :one_default_site

    ### Validators
    validates :name, presence: true

    ### Methods
    def content_header_title
      name
    end

    private
      def one_default_site
        if is_default
          Cdx::Site.all.each do |s|
            s.is_default = false
            s.save
          end
        end
      end
  end
end
