module Cdx
  module Admin
    class PagesController < PublishableResourceController

      def index
        respond_to do |format|
          format.html
          format.json { render json: PageDatatable.new(view_context) }
        end
      end
    end
  end
end
