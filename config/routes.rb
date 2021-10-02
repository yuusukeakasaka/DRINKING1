Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  scope module: 'public' do
  devise_for :users, controllers: {
    registrations: 'public/users/registrations',
    sessions: 'public/users/sessions',
    passwords: 'public/users/passwords'
  }
  root to: 'homes#top'
  get 'homes/about'
  resources :users, only:[:show, :edit, :update]

  end
end
