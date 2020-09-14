Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  mount LetterOpenerWeb::Engine, at: '/letter_opener' if Rails.env.development?
  devise_for :users, :controllers => { :registrations => 'users/registrations', :sessions => 'users/sessions' }
  # devise_for :users, :controllers => {:registrations => 'users/registrations',:sessions => 'users/sessions'} 
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: 'homes#top'
  get "home/welcome" => "homes#welcome"
  resources :posts do
    resource :likes, only: %i[create destroy]
    resources :comments, only: %i[create destroy]
  end
  resources :users, only: %i[show edit update index]
  resources :matches, only: %i[index update destroy create edit]
  resources :contacts, only: [:create]
  resources :messages, only: %i[create destroy]
  resources :rooms, only: %i[create show]
  resource :contacts, only: %i[new create]
end
