# frozen_string_literal: true

Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      get 'quotes/:tag', to: 'quotes#search_tag', as: :search_tag
      post '/auth', to: 'auth#create'
    end
  end
end
