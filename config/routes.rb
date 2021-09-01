Rails.application.routes.draw do
  scope "(:locale)", locale: /#{I18n.available_locales.join("|")}/ do
    root 'static_pages#home'
    get 'static_pages/help'
    resources :users
  end
end

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
