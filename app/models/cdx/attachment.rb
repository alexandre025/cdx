module Cdx
  class Attachment < ApplicationRecord

    belongs_to :asset

    belongs_to :record, polymorphic: true, touch: true

  end
end
