require 'rails_helper'

module Cdx
  RSpec.describe Admin::UsersController, type: :controller do
    routes { Cdx::Engine.routes }
    render_views

    logged_in

    let(:user) { create(:cdx_user) }

    describe '#GET index' do
      it { expect(get :index).to have_http_status(200) }
    end

    describe '#GET edit' do
      it { expect(get :edit, params: { id: user }).to have_http_status(200) }
    end

    describe '#PATCH update' do
      context 'when sucess' do
        it { expect(patch :update, params: { id: user, user: FactoryGirl.attributes_for(:cdx_user) }).to have_http_status(302) }
      end

      context 'when failed' do
        it { expect(patch :update, params: { id: user, user: { email: 'fake' } }).to have_http_status(200) }
      end
    end

    describe '#POST create' do
      context 'when success' do
        it { expect(post :create, params: { user: FactoryGirl.attributes_for(:cdx_user) }).to have_http_status(302) }
      end

      context 'when failed' do
        it { expect(post :create, params: { user: {} }).to have_http_status(200) }
      end
    end
  end
end
