module Cdx
  module Admin
    class HomeController < BaseController
      before_action :authenticate_admin_user!

      def index

      end

    end
  end
end