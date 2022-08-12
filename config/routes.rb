Rails.application.routes.draw do
  devise_for :users

  resources :categorys do
    resources :transactions
  end

  root "categorys#index"
end
