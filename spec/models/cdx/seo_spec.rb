require 'rails_helper'

module Cdx
  RSpec.describe Seo, type: :model do

    let(:seo) { create(:cdx_seo) }

    describe '#save!' do
      it { expect(build(:cdx_seo).save!).to eq(true) }
    end

  end
end
