module Cdx
  class ApplicationController < ActionController::Base
    protect_from_forgery with: :exception

    include Cdx::ControllerHelpers::Seo
    include Cdx::ControllerHelpers::Settings

    def current_ability
      if try(:current_user)
        controller_name_segments = params[:controller].split('/')
        controller_name_segments.pop
        controller_namespace = controller_name_segments.join('/').camelize

        @current_ability ||= Ability.new(current_user, controller_namespace, Cdx::Site.current)
      end
    end
  end
end
