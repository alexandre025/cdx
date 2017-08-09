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

  end
end
