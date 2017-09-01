module Cdx
  module Admin
    class SettingsController < BaseController
      before_action :authenticate_admin_user!

      before_action :load_settings, only: [:edit, :update]

      def edit

      end

      def update
        if @settings.update_attributes setting_params
          flash_message(@settings, :update, :success)
          redirect_to location_after_save
        else
          flash_message(@settings, :update, :error)
          render :edit
        end
      end

      def clear_cache

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
