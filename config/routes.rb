Rails.application.routes.draw do
  scope "(:locale)", locale: /#{I18n.available_locales.join("|")}/ do
  root 'static_pages#home'
  get 'static_pages/help'
  get "/signup",  to: "users#new"
  post "/signup", to:"users#create"
  resources :users, only: %i(new create show)
end
