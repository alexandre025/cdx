module Cdx
  class Asset < ApplicationRecord
    include AssetUploader[:file]

    has_many :attachments, dependent: :destroy
  end
end
