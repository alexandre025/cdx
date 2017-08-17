require 'rails_helper'

module Cdx
  RSpec.describe Taxonomy, type: :model do

    subject(:taxonomy) { create(:cdx_taxonomy) }

    describe '#save!' do
      it { expect(build(:cdx_taxonomy).save!).to eq(true) }
    end

  end
end
