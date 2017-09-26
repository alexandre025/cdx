module Cdx
  class Asset < ApplicationRecord
    has_many :attachments, dependent: :destroy
  end
end
