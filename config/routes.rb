Rails.application.routes.draw do
  devise_for :users
  root to: "pages#home"
  get '/dashboard', to: 'profiles#dashboard'
  get '/dashboard/edit', to: 'profiles#edit'
  patch '/dashboard', to: 'profiles#update', as: :user
  get '/my_medications', to: 'user_medications#my_medications'
  resources :orders, only: %i[new create show index]
  resources :user_medications, only: [] do
    resources :refills, only: %i[create update]
  end
end
