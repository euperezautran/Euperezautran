Rails.application.routes.draw do
  devise_for :users

  resources :todo_lists do
    resources :tasks do
      member do
       patch :complete
      end
    end
  end

  root to: 'todo_lists#index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
