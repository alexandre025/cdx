module Cdx
  class Asset::User::Avatar < Asset
    has_attached_file :file,
                      styles:         { thumb: '100x100>', regular: '250x250>' },
                      default_style:  :regular,
                      default_url:    '/default/user/avatar/:style.png',
                      url:            '/cdx/user/avatar/:id/:style/:basename.:extension',
                      path:           ':rails_root/public/cdx/user/avatar/:id/:style/:basename.:extension',
                      convert_option: { all: '-strip -auto-orient' }

    include Cdx::ImageAsset
  end
end