Rails.application.routes.draw do
  get 'sessions/new'
  get 'users/new'
  resources :articles do
    resources :comments do
      post "favorites", to: "favorites#create"
    end
  end
  resources :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'articles#index'
  post 'articles' => 'articles#create'
  get '/signup' => 'users#new'
  post '/signup',  to: 'users#create'
  get    '/login',   to: 'sessions#new'
  post   '/login',   to: 'sessions#create'
  delete '/logout',  to: 'sessions#destroy'
end
