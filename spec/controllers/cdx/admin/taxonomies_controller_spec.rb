require 'rails_helper'

module Cdx
  RSpec.describe Admin::TaxonomiesController, type: :controller do
    routes { Cdx::Engine.routes }
    render_views

    logged_in

    let(:taxonomy) { create(:cdx_taxonomy) }

    describe '#GET index' do
      it { expect(get :index).to have_http_status(200) }
    end

    describe '#GET edit' do
      it { expect(get :edit, params: { id: taxonomy }).to have_http_status(200) }
    end

    describe '#PATCH update' do
      context 'when sucess' do
        it { expect(patch :update, params: { id: taxonomy, taxonomy: FactoryGirl.attributes_for(:cdx_taxonomy) }).to have_http_status(302) }
      end

      context 'when failed' do
        it { expect(patch :update, params: { id: taxonomy, taxonomy: { name: '' } }).to have_http_status(200) }
      end
    end

    describe '#POST create' do
      context 'when success' do
        it { expect(post :create, params: { taxonomy: FactoryGirl.attributes_for(:cdx_taxonomy) }).to have_http_status(302) }
      end

      context 'when failed' do
        it { expect(post :create, params: { taxonomy: {} }).to have_http_status(200) }
      end
    end
  end
end
