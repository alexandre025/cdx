Cdx::Engine.routes.draw do
  namespace :admin do
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
  end
end
