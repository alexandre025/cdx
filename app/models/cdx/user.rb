module Cdx
  class User < ApplicationRecord
    include Cdx::Admin::ResourceRecord

    # Devise
    # Include default devise modules. Others available are:
    # :confirmable, :lockable, :timeoutable and :omniauthable
    devise :database_authenticatable, :registerable,
           :recoverable, :rememberable, :trackable, :validatable

    # Settings
    store_accessor :settings, :theme

    # Validators
    validates :email, :first_name, :last_name, presence: true

    # Methods
    def content_header_title
      email
    end

    def gravatar_url
      "https://www.gravatar.com/avatar/#{Digest::MD5.hexdigest(email.downcase)}"
    end

    def full_name
      "#{first_name} #{last_name}".strip
    end
  end
end
