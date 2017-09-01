module Cdx
  module Admin
    class PublishableResourceController < ResourceController
      def update
        @object.assign_attributes permitted_resource_params

        if @object.send current_action
          flash_message(@object,(current_action == :save ? :update : current_action), :success)
          redirect_to location_after_save
        else
          flash_message(@object,(current_action == :save ? :update : current_action), :error)
          render :edit
        end
      end

      def create
        @object.assign_attributes permitted_resource_params

        if @object.send current_action
          flash_message(@object,:create, :success)
          redirect_to location_after_save
        else
          flash_message(@object,:create, :error)
          render :new
        end
      end

      private

        def current_action
          action = :publish if params[:publish]
          action = :unpublish if params[:unpublish]
          action ||= :save
        end
    end
  end
end
