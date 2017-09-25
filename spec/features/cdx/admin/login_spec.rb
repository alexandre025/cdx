require 'rails_helper'

RSpec.feature 'Login to admin dashboard', type: :feature do

  let(:user) { create(:cdx_user, password: :feature) }

  scenario 'User success to login' do
    visit '/admin'

    fill_in id: 'admin_user_email', with: user.email
    fill_in id: 'admin_user_password', with: :feature

    click_button

    expect(page).to have_text('Dashboard')
  end

  scenario 'User fail to login' do
    visit '/admin'

    click_button

    expect(page).to have_text('Invalid Email or password.')
  end

end