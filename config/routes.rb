Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root "homes#index"
  resources :users, only: [:show, :index] do
    resources :products do
      resources :comments, only: [:create, :edit, :update, :destroy]
    end
  end
end
