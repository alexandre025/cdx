Rails.application.routes.draw do
  mount Cdx::Engine => '/'
end

Cdx::Engine.routes.append do

  get '/pages/:id', to: 'static#show'

end
