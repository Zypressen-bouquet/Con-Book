Rails.application.routes.draw do

  devise_for :admins, controllers: {
  sessions: 'admins/sessions'
  }
  devise_for :users


  resources :books, only: [:index,:show]
  resources :genres, only: [:index] do
    resources :books, only: [:index]
  end


  resources :users, only: [:show,:edit,:update] do
    member do
      get 'quit'
      put 'user_quit'
    end
  end


  # Adminのrouting
  namespace :admin do
    get 'homes/top' => 'homes#top'
    resources :genres, only: [:index,:edit,:create,:update]
    resources :orders, only: [:index,:show,:update]
    resources :ordered_products, only: [:update]
    resources :products, only: [:index,:new,:create,:show,:edit,:update]
    resources :users, only: [:index,:show,:edit,:update]
  end

end


end
