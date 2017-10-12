module Support
  module ControllerMacros
    def logged_out
      before :each do
        @request.env['devise.mapping'] = Devise.mappings[:admin_user]
      end
    end

    def logged_in
      before :each do
        @request.env['devise.mapping'] = Devise.mappings[:admin_user]
        admin_user                     = create(:cdx_user, :admin)
        sign_in admin_user, scope: :admin_user
      end
    end
  end
end
