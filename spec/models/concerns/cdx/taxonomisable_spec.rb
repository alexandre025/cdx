require 'rails_helper'

module Cdx

  Page.class_eval do
    include Taxonomisable::Multiple
  end

  RSpec.describe Page, type: :model do

    subject(:page) { create(:cdx_page) }

    describe '#taxons' do

      before do
        page.taxons << create_list(:cdx_taxon, 10)
      end

      it { expect(page.taxons.size).to eq(10) }
      it { expect(page.taxonomies).to include(page.taxons.first.taxonomy) }

    end

  end

end

