Rails.application.routes.draw do
  root 'homes#top'
  devise_for :admins, controllers: {
  sessions: 'admins/sessions'
  }
  devise_for :users


  resources :books do
    # いいね機能
    resource :favorites, only: [:create, :destroy]
    # コメント機能 resources 複数コメントをid判別している
    resources :book_comments, only: [:create, :destroy]
  end

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
    resources :books, only: [:index,:show,:update,:destroy]
    resources :users, only: [:index,:show,:edit,:update]
  end

end


