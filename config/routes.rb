Rails.application.routes.draw do
  devise_for :users
  get "top" => "home#top"
  get "about" => "home#about"
  root "users#show" # ログイン後マイページへ飛ぶ
  resources :books
  resources :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
