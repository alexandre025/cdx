module Cdx
  module Admin
    class ResourceController < BaseController

      before_action :load_resource

      helper_method :member_action?, :new_object_url, :edit_object_url, :object_url, :collection_url

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
          @object ||= load_resource_instance
          instance_variable_set("@#{resource.object_name}", @object)
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

      def load_resource_instance
        if new_actions.include? action_name.to_sym
          build_resource
        elsif params[:id]
          find_resource
        end
      end

      def build_resource
        if parent_data.present?
        else
          # This line should be overridden when custom resource initializer is needed
          model_class.new
        end
      end

      def find_resource
        if parent_data.present?
        else
          # TODO : Friendly ID (conditional)
          model_class.find(params[:id])
        end
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

      def new_actions
        [:new, :create]
      end

      def member_action?
        !collection_actions.include? action_name.to_sym
      end

      def new_object_url(options = {})
        if parent_data.present?

        else

        end
      end

      def edit_object_url(object, options = {})
        if parent_data.present?

        else
          cdx.send "edit_admin_#{resource.object_name}_url", object, options
        end
      end

      def object_url(object = nil, options = {})
        target = object ? object : @object
        if parent_data.present?

        else
          cdx.send "edit_admin_#{resource.object_name}_url", target, options
        end
      end

      def collection_url(options = {})
        if parent_data.present?

        else

        end
      end

    end
  end
end
