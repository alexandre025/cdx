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

    resources :users, except: :show

    resources :sites, except: :show

    resources :pages, except: :show

    resources :taxonomies do
      resources :taxons, except: :show, controller: 'taxonomies/taxons' do
        collection do
          post 'update_position', to: 'taxonomies/taxons#update_position'
        end
      end
    end
  end
end
