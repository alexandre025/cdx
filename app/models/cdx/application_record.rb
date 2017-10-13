module Cdx
  class ApplicationRecord < ActiveRecord::Base
    self.abstract_class = true

    extend Cdx::AttachmentMacros
  end
end
