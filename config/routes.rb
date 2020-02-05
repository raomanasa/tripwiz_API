Rails.application.routes.draw do
  mount_devise_token_auth_for 'User', at: 'auth'
  namespace :api do
    namespace :v1, defaults: { format: :json } do
      resources :trips, only: [:create]
    end
  end
end
