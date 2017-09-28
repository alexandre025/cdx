module Cdx
  module Admin
    class BaseController < Cdx::ApplicationController
      layout 'cdx/admin'

      before_action :set_locale

      def authenticate_admin_user!
        if admin_user_signed_in?
          super
        else
          redirect_to new_admin_user_session_path
        end
      end

      private

        def set_locale
          I18n.locale = current_settings.default_locale || I18n.default_locale
        end

        def flash_message(object, action, context)
          object_name    = object.class.name.demodulize.downcase
          flash[context] = t("admin.flash.#{object_name}.#{action}.#{context}", default: t("admin.flash.default.#{action}.#{context}", n: object_name.capitalize))
        end
    end
  end
end
