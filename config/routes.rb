Rails.application.routes.draw do
  resources :posts do             # ex: /post/:id/comments/edit/:id ...
    resources :comments
  end

  resources :comments do          # ex: /comment/:id/comments/edit/:id ...
    resources :comments
  end
  
  get 'history', to: 'comments#history' # comments controller history action

  devise_for :users
  root 'posts#index'
  get 'about', to: 'pages#about'

  devise_scope :user do
    get 'users/sign_out' => "devise/sessions#destroy"
  end
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
