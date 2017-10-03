module Cdx
  class Asset::Seo::OgImage < Asset
    has_attached_file :attachment,
                      styles:  { thumb: '600x315^', regular: '1200x630^' },
                      url:            '/cdx/seo/og_image/:id/:style/:basename.:extension',
                      path:           ':rails_root/public/cdx/seo/og_image/:id/:style/:basename.:extension',
                      convert_option: { all: '-strip -crop -gravity center -auto-orient' }

    include Cdx::ImageAsset
  end
end
