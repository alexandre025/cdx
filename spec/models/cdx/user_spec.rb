require 'rails_helper'

module Cdx
  RSpec.describe User, type: :model do

    subject(:user) { create(:cdx_user) }

    describe '#save!' do
      it { expect(build(:cdx_user).save!).to eq(true) }
    end

    describe '#full_name' do
      it { expect(user.full_name).to eq("#{user.first_name} #{user.last_name}") }
    end

  end
end
