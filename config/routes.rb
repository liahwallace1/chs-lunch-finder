Rails.application.routes.draw do

  namespace :api do
    resources :restaurants, only: [:index, :show, :create, :destroy]
    resources :hashtags, only: [:index]
  end
end
