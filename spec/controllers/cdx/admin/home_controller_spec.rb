require 'rails_helper'

module Cdx
  RSpec.describe Admin::HomeController, type: :controller do
    routes { Cdx::Engine.routes }
    render_views

    describe '#GET index' do
      context 'when logged_out' do
        logged_out

        it { expect(get :index).to have_http_status(302) }
      end

      context 'when logged in' do
        logged_in

        it { expect(get :index).to have_http_status(200) }
      end
    end
  end
end
