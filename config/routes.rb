# frozen_string_literal: true

Rails.application.routes.draw do
  namespace :api do
    namespace :v1, defaults: { format: :json } do
      resources :trips, only: [:create]
      resources :activity_types, only: %i[create index]
      resources :hotels, only: %i[create index]
      delete 'hotels', to: 'hotels#destroy'
    end
  end
end
