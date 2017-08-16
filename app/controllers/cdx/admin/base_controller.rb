module Cdx
  module Admin
    class BaseController < Cdx::ApplicationController
      layout 'cdx/admin'

      def authenticate_admin_user!
        if admin_user_signed_in?
          super
        else
          redirect_to new_admin_user_session_path
        end
      end
    end
  end
end
