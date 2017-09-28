require 'rails_helper'

module Cdx
  RSpec.describe Site, type: :model do

    subject(:site) { create(:cdx_site, default: true) }

    describe '#save!' do
      it { expect(build(:cdx_site, default: true).save!).to eq(true) }
    end

    describe '::default' do
      it { is_expected.to eq(Site.default) }
    end

    describe '::current' do
      it { is_expected.to eq(Site.current) }
      it { is_expected.to eq(Site.current(site.domain)) }
    end

  end
end
