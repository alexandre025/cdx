require 'rails_helper'

module Cdx
  module Admin
    RSpec.describe BaseHelper, type: :helper do

      helper do
        def current_settings
          @current_settings ||= FactoryGirl.create(:cdx_setting)
        end

        def current_admin_user
          @current_admin_user ||= FactoryGirl.create(:cdx_user)
        end
      end

      describe '#theme_class' do

        it 'return current settings default theme' do
          current_settings.default_theme = :green
          expect(helper.theme_class).to eq('skin-green')
        end

        it 'return user personnal setting first' do
          current_admin_user.theme = :red
          expect(helper.theme_class).to eq('skin-red')
        end

        it 'return default theme when current settings and user settings are empty' do
          expect(helper.theme_class).to eq('skin-yellow')
        end

      end

    end
  end
end