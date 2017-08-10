module Cdx
  class User < ApplicationRecord
    # Include default devise modules. Others available are:
    # :confirmable, :lockable, :timeoutable and :omniauthable
    devise :database_authenticatable, :registerable,
           :recoverable, :rememberable, :trackable, :validatable

    include Cdx::Admin::ResourceRecord

    def content_header_title
      email
    end

    store_accessor :settings, :theme

    def gravatar_url
      "https://www.gravatar.com/avatar/#{Digest::MD5.hexdigest(email.downcase)}"
    end

  end
end
