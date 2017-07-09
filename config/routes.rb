Rails.application.routes.draw do

  namespace :api do
    resources :restaurants, only: [:index, :show, :update]
    resources :hashtags, only: [:index]
  end
end
