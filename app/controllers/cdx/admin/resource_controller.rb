module Cdx
  module Admin
    class ResourceController < BaseController

      before_action :load_resource

      def index

      end

      def new

      end

      def edit

      end

      def update

      end

      def create

      end

      def destroy

      end

      protected

      class << self
        attr_accessor :parent_data

        def belongs_to(model_name, options = {})
          @parent_data ||= {}
          @parent_data[:model_name] = model_name
          @parent_data[:model_class] = model_name.to_s.classify.constantize
          @parent_data[:find_by] = options[:find_by] || :id
        end
      end

      def load_resource
        if member_action? # Load member action

        else # Load collection
          @collection ||= collection
          instance_variable_set("@#{controller_name}", @collection)
        end
      end

      def collection
        model_class.where(nil)
      end

      def resource
        return @resource if @resource
        parent_model_name = parent_data[:model_name] if parent_data
        @resource = Cdx::Admin::Resource.new controller_path, controller_name, parent_model_name, object_name
      end

      def parent_data
        self.class.parent_data
      end

      def model_class
        @model_class ||= resource.model_class
      end

      # This method should be overridden when object_name does not match the controller name
      def object_name

      end

      def collection_actions
        [:index]
      end

      def member_action?
        !collection_actions.include? action_name.to_sym
      end

    end
  end
end
