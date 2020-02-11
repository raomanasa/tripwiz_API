# frozen_string_literal: true

Rails.application.routes.draw do
  namespace :api do
    namespace :v1, defaults: { format: :json } do
      resources :trips, only: [:create]
      resources :hotels, only: %i[create index]
      delete 'hotels', to: 'hotels#destroy'
      resources :activity_types, only: [:create]
    end
  end
end
