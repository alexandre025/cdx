require 'rails_helper'

module Cdx
  RSpec.describe StaticController, type: :controller do
    routes { Cdx::Engine.routes }
    render_views

    logged_in

    let(:page) { create(:cdx_page, template: :contact) }

    describe '#GET show' do

      before do
        page.publish
        get :show, params: { id: page }
      end

      it { expect(response).to have_http_status(200) }
      it { expect(response).to render_template(:show) }
    end

  end
end
