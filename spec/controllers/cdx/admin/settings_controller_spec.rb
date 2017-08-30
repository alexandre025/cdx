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
        it { expect(patch :update, params: { settings: FactoryGirl.attributes_for(:cdx_setting) }).to have_http_status(302) }
      end

      context 'when failed' do
        it { expect(patch :update, params: { settings: '#' }).to have_http_status(302) }
      end
    end

    describe '#POST clear_cache' do

    end
  end
end
