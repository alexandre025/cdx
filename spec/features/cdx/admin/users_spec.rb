require 'rails_helper'

RSpec.feature 'Users CRUD', type: :feature do

  let(:user) { create(:cdx_user, :admin) }

  before do
    login_as(user)
  end

  scenario 'List users', js: true do
    visit '/admin/users'
    expect(page).to have_text(user.email)
  end

end
