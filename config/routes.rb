Hearno::Application.routes.draw do
  authenticated :user do
    root :to => 'home#index'
  end
  root :to => "home#index"
  match 'beta' => 'home#beta'
  match 'about' => 'home#about'

  devise_for :users
  resources :users
end
