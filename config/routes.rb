Rails.application.routes.draw do
  devise_for :users, controllers: {
    sessions: 'users/sessions',
    registrations: 'users/registrations'
  }

  root 'homes#top'

  get '/homes/top', to: 'homes#top', as: 'top'
  get '/home/about', to: 'homes#about', as: 'about'
  
  resources :books

  resources :users

end
