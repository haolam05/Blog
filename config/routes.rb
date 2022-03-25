Rails.application.routes.draw do
  devise_for :users
  root 'pages#about'
  get 'about', to: 'pages#about'

  devise_scope :user do
    get 'users/sign_out' => "devise/sessions#destroy"
  end
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
