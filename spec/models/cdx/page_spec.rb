require 'rails_helper'

module Cdx
  RSpec.describe Page, type: :model do

    subject(:page) { create(:cdx_page) }

    describe '#save!' do
      it { expect(build(:cdx_page).save!).to eq(true) }
      it { expect(page.state).to eq('draft') }
    end

    describe '#publish' do
      before :each do
        page.publish!
      end

      it { expect(page.state).to eq('published') }
      it { expect(page.published_on).not_to eq(nil) }
    end

    describe '#unpublish' do
      before :each do
        page.publish!
        page.unpublish!
      end

      it { expect(page.state).to eq('draft') }
    end

  end
end
