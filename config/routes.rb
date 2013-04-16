Hearno::Application.routes.draw do
  authenticated :user do
    root :to => 'home#index'
  end
  root :to => "home#index"
  match 'beta' => 'home#beta'

  devise_for :users
  resources :users
end
