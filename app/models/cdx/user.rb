module Cdx
  class User < ApplicationRecord
    include Cdx::Resourceable

    AVAILABLE_ROLES = Cdx.user_available_roles.freeze

    # Devise
    # Include default devise modules. Others available are:
    # :confirmable, :lockable, :timeoutable and :omniauthable
    devise :database_authenticatable, :registerable,
           :recoverable, :rememberable, :trackable, :validatable

    # Associations
    has_one :avatar_attachment, -> { where(name: :avatar) }, as: :record, class_name: 'Attachment', dependent: :destroy
    has_one :avatar, through: :avatar_attachment, class_name: 'Asset::User::Avatar', source: :asset

    accepts_nested_attributes_for :avatar, allow_destroy: true

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

    def admin?
      has_role?(:admin)
    end

    def has_role?(role)
      roles.include? role.to_s
    end
  end
end
