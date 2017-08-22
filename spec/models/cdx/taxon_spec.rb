require 'rails_helper'

module Cdx
  RSpec.describe Taxon, type: :model do

    subject(:taxon) { create(:cdx_taxon) }

    describe '#save!' do
      it { expect(build(:cdx_taxon).save!).to eq(true) }
    end

    describe 'acts_as_nested_set' do
      it { expect(taxon.depth).to eq(0) }
      it { expect(taxon.parent).to eq(nil) }
      it { expect(taxon.children).to be_empty }
    end

  end
end
