require 'rails_helper'

module Cdx
  RSpec.describe Admin::SitesController, type: :controller do
    routes { Cdx::Engine.routes }
    render_views

    logged_in

    let(:site) { create(:cdx_site) }

    describe '#GET index' do
      it { expect(get :index).to have_http_status(200) }
    end

    describe '#GET edit' do
      it { expect(get :edit, params: { id: site }).to have_http_status(200) }
    end

    describe '#PATCH update' do
      context 'when sucess' do
        it { expect(patch :update, params: { id: site, site: FactoryGirl.attributes_for(:cdx_site) }).to have_http_status(302) }
      end

      context 'when failed' do
        it { expect(patch :update, params: { id: site, site: FactoryGirl.attributes_for(:cdx_site, :wrong_attributes) }).to have_http_status(200) }
      end
    end

    describe '#POST create' do
      context 'when success' do
        it { expect(post :create, params: { site: FactoryGirl.attributes_for(:cdx_site) }).to have_http_status(302) }
      end

      context 'when failed' do
        it { expect(post :create, params: { site: FactoryGirl.attributes_for(:cdx_site, :wrong_attributes) }).to have_http_status(200) }
      end
    end
  end
end
