Rails.application.routes.draw do
  mount LetterOpenerWeb::Engine, at: "/letter_opener" if Rails.env.development?
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: "homes#top"
  resources :posts do
  	resource :likes, only: [:create, :destroy]
  	resources :comments, only: [:create, :destroy]
  end
  resources :users, only: [:show, :edit, :update]
  resources :matches, only: [:index, :update, :destroy, :create, :edit]
  resources :contacts, only: [:create]
end
