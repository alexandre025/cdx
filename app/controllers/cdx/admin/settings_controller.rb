module Cdx
  module Admin
    class SettingsController < BaseController

      before_action :load_setting, only: [:edit, :update]

      def edit

      end

      def update

      end

      def clear_cache

      end

      private

      def load_setting
        @setting = Cdx::Setting.first_or_create
      end

    end
  end
end
