Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  scope module: 'public' do
  get "/users/:id/unsubscribe" => 'users#unsubscribe', as: 'user_unsubscribe'
  patch "/users/:id/withdraw" => "users#withdraw", as: 'user_withdraw'
  devise_for :users, controllers: {
    registrations: 'public/users/registrations',
    sessions: 'public/users/sessions',
    passwords: 'public/users/passwords'
  }
  root to: 'homes#top'
  get 'homes/about'
  resources :users, only:[:show, :edit, :update] do
    resource :relationships, only:[:create, :destroy]
    get 'relationships/followers' => 'relationships#followers', as: 'followers'
    get 'relationships/followings' => 'relationships#followings', as: 'followings'
  end
  resources :posts do
    resources :post_comments, only: [:create, :destroy]
    resource :favorites, only: [:create, :destroy]
    get "search", on: :collection
  end


  end


end
