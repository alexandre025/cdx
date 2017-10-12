module Support
  module FeatureMacros
    def login_as(user)
      visit '/admin'

      fill_in id: 'admin_user_email', with: user.email
      fill_in id: 'admin_user_password', with: 'cdx123'

      click_button
    end
  end
end
