module Cdx
  module Admin
    class BaseController < Cdx::ApplicationController
      include Cdx::ControllerHelpers::Locale

      layout 'cdx/admin'

      helper_method :meta_title

      def authenticate_admin_user!
        if admin_user_signed_in?
          super
        else
          redirect_to new_admin_user_session_path
        end
      end

      def meta_title
        if current_settings.meta_title
          "#{current_settings.meta_title} | Admin"
        else
          "Admin#{current_settings.acronym}"
        end
      end

      def current_ability
        if try(:current_admin_user)
          controller_name_segments = params[:controller].split('/')
          controller_name_segments.pop
          controller_namespace = controller_name_segments.join('/').camelize

          @current_ability ||= Ability.new(current_admin_user, controller_namespace, Cdx::Site.current)
        end
      end

      private

      def flash_message(object, action, context)
        object_name    = object.class.name.demodulize.downcase
        flash[context] = t("admin.flash.#{object_name}.#{action}.#{context}", default: t("admin.flash.default.#{action}.#{context}", n: object_name.capitalize))
      end
    end
  end
end
