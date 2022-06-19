Rails.application.routes.draw do
  resources :gyms, only: [:index, :show]
  resources :clients, only: [:index, :show]
  resources :memberships, only: [:index, :show, :create]

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
