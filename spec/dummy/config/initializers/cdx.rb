Cdx.setup do |config|

  # Path for admin panel
  #
  # config.admin_path = 'admin'

  # Add available roles to users
  #
  # Admin role should not be removed in order
  # to get access to admin panel
  #
  config.user_available_roles = %w(admin moderator)

  # Add available codes to taxonomies
  #
  config.taxonomy_available_codes = %w(pages test)

end
