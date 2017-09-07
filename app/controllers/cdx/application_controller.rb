module Cdx
  class ApplicationController < ActionController::Base
    protect_from_forgery with: :exception

    include Cdx::ControllerHelpers::Settings
  end
end
