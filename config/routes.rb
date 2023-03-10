Rails.application.routes.draw do
  devise_for :users
  root to: "pages#home"
  get '/dashboard', to: 'profiles#dashboard'

  get '/dashboard/edit', to: 'profiles#edit'
  patch '/dashboard', to: 'profiles#update', as: :user
  get '/dashboard/show', to: 'profiles#show'

  get '/my_medications', to: 'user_medications#my_medications'
  get '/notifications', to: 'notifications#show'
  get '/review_order', to: 'refills#review', as: :review
  resources :orders, only: %i[create show index]
  resources :user_medications, only: [] do
    resources :refills, only: %i[create update destroy]
  end
end
