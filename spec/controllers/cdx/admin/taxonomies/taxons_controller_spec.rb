require 'rails_helper'

module Cdx
  RSpec.describe Admin::Taxonomies::TaxonsController, type: :controller do
    routes { Cdx::Engine.routes }
    render_views

    logged_in

    let(:taxon) { create(:cdx_taxon) }
    let(:taxonomy) { taxon.taxonomy }

    describe '#GET index' do
      before { get :index, params: { taxonomy_id: taxonomy, format: :json } }

      it { expect(response).to have_http_status(200) }
      it { expect(json['tree'].length).to eq(1) }
      it { expect(json['create_or_update_url'].present?).to eq(true) }
    end

    describe '#POST update_position' do
      context 'move to child with index' do
        let(:parent_taxon) { create(:cdx_taxon, taxonomy: taxonomy) }

        before { post :update_position, params: { taxonomy_id: taxonomy, id: taxon, node: { parent: parent_taxon.id, position: 1 }, format: :json } }

        it { expect(response).to have_http_status(200) }
        it { expect(assigns(:taxon).parent).to eq(parent_taxon) }
      end

      context 'move to root' do
        before { post :update_position, params: { taxonomy_id: taxonomy, id: taxon, node: { parent: '#' }, format: :json } }

        it { expect(response).to have_http_status(200) }
        it { expect(assigns(:taxon).parent).to eq(nil) }
      end
    end

    describe '#POST create_or_update' do
      context 'when create' do
        before { post :create_or_update, params: { taxonomy_id: taxonomy, node: { id: 'j1_18', parent: '#', text: 'New taxon' } } }

        it { expect(response).to have_http_status(200) }
        it { expect(assigns(:taxon).persisted?).to eq(true) }
        it { expect(assigns(:taxon).parent).to eq(nil) }
      end

      context 'when update' do
        before { post :create_or_update, params: { taxonomy_id: taxonomy, node: { id: taxon.id, parent: '#', text: 'edited' } } }

        it { expect(response).to have_http_status(200) }
        it { expect(assigns(:taxon).name).to eq('edited') }
      end
    end
  end
end
