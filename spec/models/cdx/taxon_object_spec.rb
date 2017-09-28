require 'rails_helper'

module Cdx
  RSpec.describe TaxonObject, type: :model do

    subject(:taxon_object) { create(:cdx_taxon_object) }

    describe '#save!' do
      it { expect(build(:cdx_taxon_object).save!).to eq(true) }
    end

  end
end
