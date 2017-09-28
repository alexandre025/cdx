require 'rails_helper'

module Cdx
  RSpec.describe Admin::PagesController, type: :controller do
    routes { Cdx::Engine.routes }
    render_views

    logged_in

    let(:page) { create(:cdx_page) }

    describe '#GET index' do
      it { expect(get :index).to have_http_status(200) }
    end

    describe '#GET edit' do
      it { expect(get :edit, params: { id: page }).to have_http_status(200) }
    end

    describe '#PATCH update' do
      context 'when sucess' do
        it { expect(patch :update, params: { id: page, page: FactoryGirl.attributes_for(:cdx_page) }).to have_http_status(302) }

        it 'can be published' do
          patch :update, params: { id: page, publish: :publish }
          expect(assigns(:object).state).to eq('published')
        end

        it 'can be unpublished' do
          patch :update, params: { id: page, unpublish: :unpublish }
          expect(assigns(:object).state).to eq('draft')
        end
      end

      context 'when failed' do
        it { expect(patch :update, params: { id: page, page: { title: '' } }).to have_http_status(200) }
      end
    end

    describe '#POST create' do
      context 'when success' do
        let(:page) { build(:cdx_page) }

        it { expect(post :create, params: { page: page.attributes }).to have_http_status(302) }

        it 'has default state draft' do
          post :create, params: { page: page.attributes }
          expect(assigns(:object).state).to eq('draft')
        end

        it 'can be published' do
          post :create, params: { page: page.attributes, publish: :publish }
          expect(assigns(:object).state).to eq('published')
          expect(assigns(:object).published_on).not_to eq(nil)
        end
      end

      context 'when failed' do
        it { expect(post :create, params: { page: {} }).to have_http_status(200) }
      end
    end
  end
end
