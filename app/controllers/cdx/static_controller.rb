module Cdx
  class StaticController < ApplicationController
    before_action :load_object, only: :show

    # We don't provide routes for this controller, you'll need to define your own routing logic.
    def show
      begin
        render "cdx/static/custom/#{@object.template}"
      rescue ActionView::MissingTemplate
        render :show
      end
    end

    private

      def load_object
        @object = Page.with_state(:published).friendly.find(params[:id])
      end
  end
end
