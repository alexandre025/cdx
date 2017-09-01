Cdx::Engine.routes.draw do
  namespace :admin, path: Cdx.admin_path do
    root to: 'home#index'

    devise_for :users,
               class_name: 'Cdx::User',
               path: 'auth',
               path_names: { sign_in: 'login', sign_out: 'logout', confirmation: 'verification' },
               skip: %i[unlocks omniauth_callbacks registrations],
               controllers: {
                 sessions: 'cdx/admin/devise/sessions',
                 passwords: 'cdx/admin/devise/passwords'
               }

    resource :setting, path: :settings, only: [:edit, :update] do
      post 'clear_cache'
    end

    resources :users, except: :show

    resources :sites, except: :show

    resources :pages, except: :show

    resources :taxonomies do
      resources :taxons, only: [:index, :destroy], controller: 'taxonomies/taxons' do
        collection do
          post 'create_or_update', to: 'taxonomies/taxons#create_or_update'
        end
        member do
          post 'update_position', to: 'taxonomies/taxons#update_position'
        end
      end
    end
  end
end
