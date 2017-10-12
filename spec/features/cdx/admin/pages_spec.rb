require 'rails_helper'

RSpec.feature 'Pages CRUD', type: :feature do

  let(:user) { create(:cdx_user, :admin) }
  let(:pages) { create_list(:cdx_page, 10) }

  before do
    login_as(user)
  end

  scenario 'List pages', js: true do
    visit '/admin/pages'
    expect(page).to have_text(pages.first.title)
  end

end
