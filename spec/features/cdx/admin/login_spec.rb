require 'rails_helper'
require 'byebug'

RSpec.feature 'Login to admin dashboard', type: :feature do

  let(:user) { create(:cdx_user, :admin) }

  scenario 'success to login', js: true do
    login_as(user)

    expect(page).to have_text('Dashboard')
  end

  scenario 'fail to login', js: true do
    visit '/admin'

    click_button

    expect(page).to have_text('Invalid Email or password.')
  end

  scenario 'retrieve password', js: true do
    visit '/admin/auth/password/new'

    fill_in id: 'admin_user_email', with: user.email

    click_button

    expect(current_path).to eq('/admin/auth/login')
  end

end
