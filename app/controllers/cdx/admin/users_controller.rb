module Cdx
  module Admin
    class UsersController < ResourceController
      before_action :update_without_password, only: :update
      
      def edit
        @object.avatar ||= Asset.new
      end

      def index
        respond_to do |format|
          format.html
          format.json { render json: UserDatatable.new(view_context) }
        end
      end

      private

      def update_without_password
        if params[:user][:password].blank?
          params[:user].delete('password')
          params[:user].delete('password_confirmation')
        end
      end
    end
  end
end
