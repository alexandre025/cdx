require 'rails_helper'

module Cdx
  RSpec.describe Setting, type: :model do
    subject(:settings) { create(:setting, acronym: 'cdx') }

    describe '#save!' do
      it { expect(build(:setting).save!).to eq(true) }
    end

    describe '#acronym' do
      it 'upcase value' do
        expect(settings.acronym).to eq('CDX')
      end
    end

    describe '#available_locales' do
      it '<< default_locale' do
        expect(settings.available_locales).to eq(%w(fr es en))
      end
    end

    describe '::current' do
      it { is_expected.to eq(Setting.current) }
    end

  end
end
