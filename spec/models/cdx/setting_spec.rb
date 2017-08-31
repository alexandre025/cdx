require 'rails_helper'

module Cdx
  RSpec.describe Setting, type: :model do
    subject(:setting) { create(:cdx_setting) }

    describe '#save!' do
      it { expect(build(:cdx_setting).save!).to eq(true) }
    end

    describe '::current' do
      it { is_expected.to eq(Setting.current) }
    end

  end
end
