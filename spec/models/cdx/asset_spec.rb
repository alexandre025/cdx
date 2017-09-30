require 'rails_helper'

module Cdx
  RSpec.describe Asset, type: :model do

    subject(:asset) { create(:cdx_asset) }

    describe '#save!' do
      it { expect(build(:cdx_asset).save!).to eq(true) }
    end
  end
end
