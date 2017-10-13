module Cdx
  class User < ApplicationRecord
    include Cdx::Resourceable

    AVAILABLE_ROLES = Cdx.user_available_roles.freeze

    # Devise
    # Include default devise modules. Others available are:
    # :confirmable, :lockable, :timeoutable and :omniauthable
    devise :database_authenticatable, :registerable,
           :recoverable, :rememberable, :trackable, :validatable

    # Assets
    has_one_attached :avatar, 'Asset::User::Avatar'

    # Settings
    store_accessor :settings, :theme

    # Validators
    validates :email, presence: true

    # Methods
    def content_header_title
      email_was
    end

    def avatar_url(style = :thumb)
      avatar&.attachment_file_name ? avatar.attachment.url(style) : gravatar_url
    end

    def gravatar_url
      "https://www.gravatar.com/avatar/#{Digest::MD5.hexdigest(email.downcase)}"
    end

    def full_name
      "#{first_name} #{last_name}".strip
    end

    def has_role?(role)
      roles.include? role.to_s
    end

    Cdx.user_available_roles.each do |role|
      define_method("is_#{role}?") do
        has_role?(role)
      end
    end
  end
end
