Rails.application.routes.draw do
  get 'users/new'
  resources :articles do
    resources :comments
  end
  resources :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'articles#index'
  post 'articles' => 'articles#create'
  post '/signup',  to: 'users#create'
end
