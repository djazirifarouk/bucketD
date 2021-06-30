Rails.application.routes.draw do
  devise_for :users
  resources :wishes do
    member { patch 'incr_budget_achieved' }
  end
  get 'about/index'
  root 'home#index'
  #root 'wishes#index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
