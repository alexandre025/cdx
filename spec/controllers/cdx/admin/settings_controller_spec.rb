require 'rails_helper'

module Cdx
  RSpec.describe Admin::SettingsController, type: :controller do
    routes { Cdx::Engine.routes }
    render_views

    logged_in

    describe '#GET edit' do
      it { expect(get :edit).to have_http_status(200) }
    end

    describe '#PATCH update' do
      context 'when sucess' do
        it { expect(patch :update, params: { setting: FactoryGirl.attributes_for(:setting) }).to have_http_status(302) }
      end

      context 'when failed' do
        it { expect(patch :update, params: { setting: FactoryGirl.attributes_for(:setting, :wrong_attributes) }).to have_http_status(200) }
      end
    end

    describe '#POST clear_cache' do
      before :each do
        post :clear_cache
      end

      it { expect(response).to have_http_status(200) }
      it { expect(json['flash']['type']).to eq('success') }
      it { expect(json['flash']['message'].blank?).to eq(false) }
    end
  end
end
