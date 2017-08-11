module Cdx
  module Admin
    class PublishableResourceController < ResourceController

      def update
        @object.assign_attributes permitted_resource_params

        if @object.send current_action
          redirect_to location_after_save
        else
          render :edit
        end
      end

      def create
        @object.assign_attributes permitted_resource_params

        if @object.send current_action
          redirect_to location_after_save
        else
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