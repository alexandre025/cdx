module Cdx
  module Admin
    class ResourceController < BaseController
      before_action :authenticate_admin_user!

      before_action :load_resource

      before_action :authorize_admin

      helper_method :member_action?, :new_object_url, :edit_object_url, :object_url, :collection_url, :parent_collection_url, :parent_object_url, :edit_parent_object_url

      def index

        @collection = @collection.page(params[:page])
      end

      def new
      end

      def edit
      end

      def update
        if @object.update permitted_resource_params
          flash_message(@object, :update, :success)
          redirect_to location_after_save
        else
          flash_message(@object, :update, :error)
          render :edit
        end
      end

      def create
        if @object.update permitted_resource_params
          flash_message(@object, :create, :success)
          redirect_to location_after_save
        else
          flash_message(@object, :create, :error)
          render :new
        end
      end

      def destroy
        if @object.destroy
          flash_message(@object, :destroy, :success)
        else
          flash_message(@object, :destroy, :error)
        end

        redirect_to location_after_destroy
      end

      protected

      class << self
        attr_accessor :parent_data

        def belongs_to(model_name, options = {})
          @parent_data               ||= {}
          @parent_data[:model_name]  = model_name
          @parent_data[:model_class] = model_name.to_s.classify.constantize
          @parent_data[:find_by]     = options[:find_by] || :id
        end
      end

      # Allow all attributes to be updatable.
      #
      # Other controllers can, should, override it to set custom logic
      def permitted_resource_params
        params[resource.object_name].present? ? params.require(resource.object_name).permit! : ActionController::Parameters.new
      end

      def load_resource
        if member_action? # Load member action
          @object ||= load_resource_instance
          authorize! action, @object
          instance_variable_set("@#{resource.object_name}", @object)
        else # Load collection
          @collection ||= collection
          instance_variable_set("@#{controller_name}", @collection)
        end
      end

      def collection
        return parent.send(controller_name) if parent_data.present?
        if model_class.respond_to?(:accessible_by)
          model_class.accessible_by(current_ability, action)
        else
          model_class.where(nil)
        end
      end

      def resource
        return @resource if @resource
        parent_model_name = parent_data[:model_name] if parent_data
        @resource         = Cdx::Admin::Resource.new controller_path, controller_name, parent_model_name, object_name
      end

      def load_resource_instance
        if new_actions.include? action
          build_resource
        elsif params[:id]
          find_resource
        end
      end

      def build_resource
        if parent_data.present?
          parent.send(controller_name).build
        else
          # This line should be overridden when custom resource initializer is needed
          model_class.new
        end
      end

      def find_resource
        if parent_data.present?
          parent.send(controller_name).find(params[:id])
        else
          model_class.respond_to?(:friendly) ? model_class.friendly.find(params[:id]) : model_class.find(params[:id])
        end
      end

      def parent_data
        self.class.parent_data
      end

      def parent
        if parent_data.present?
          @parent ||= parent_data[:model_class].send(:find_by, parent_data[:find_by].to_s => params["#{resource.model_name}_id"])
          instance_variable_set("@#{resource.model_name}", @parent)
        else
          nil
        end
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
        !collection_actions.include? action
      end

      def new_object_url(options = {})
        if parent_data.present?
          cdx.new_polymorphic_url([:admin, parent, model_class], options)
        else
          cdx.new_polymorphic_url [:admin, model_class], options
        end
      end

      def edit_object_url(object, options = {})
        if parent_data.present?
          cdx.send "edit_admin_#{resource.model_name}_#{resource.object_name}_url", parent, object, options
        else
          cdx.send "edit_admin_#{resource.object_name}_url", object, options
        end
      end

      def edit_parent_object_url(options = {})
        cdx.send("edit_admin_#{parent.model_name.param_key}_url", parent, options) if parent_data.present?
      end

      def object_url(object = nil, options = {})
        target = object ? object : @object
        if parent_data.present?
          cdx.send "admin_#{resource.model_name}_#{resource.object_name}_url", parent, target, options
        else
          cdx.send "admin_#{resource.object_name}_url", target, options
        end
      end

      def parent_object_url(options = {})
        cdx.send("admin_#{parent.model_name.param_key}_url", parent, options) if parent_data.present?
      end

      def collection_url(options = {})
        if parent_data.present?
          cdx.polymorphic_url([:admin, parent, model_class], options)
        else
          cdx.polymorphic_url [:admin, model_class], options
        end
      end

      def parent_collection_url(options = {})
        cdx.polymorphic_url([:admin, parent], options) if parent_data.present?
      end

      def location_after_destroy
        collection_url
      end

      def location_after_save
        collection_url
      end

      def authorize_admin
        authorize! action, model_class
      end
    end
  end
end
