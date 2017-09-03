module Cdx
  module Admin
    class SettingsController < BaseController
      before_action :authenticate_admin_user!

      before_action :load_settings, only: [:edit, :update]

      def edit
      end

      def update
        if @settings.update_attributes setting_params

          I18n.locale = @settings.default_locale

          flash_message(@settings, :update, :success)
          redirect_to location_after_save
        else
          flash_message(@settings, :update, :error)
          render :edit
        end
      end

      def clear_cache
        Rails.cache.clear
        render json: { flash: { type: :success, message: t('admin.flash.settings.clear_cache.success') } }
      end

      private

        def setting_params
          params.require(:setting).permit!
        end

        def load_settings
          @settings = current_settings
        end

        def location_after_save
          edit_admin_setting_path
        end
    end
  end
end
