Rails.application.routes.draw do
  devise_for :users
  root to: "pages#home"
  get '/dashboard', to: 'profiles#dashboard'
  get '/my_medications', to: 'user_medications#my_medications'
  get '/dashboard/edit', to: 'porfiles#edit'
  resources :order, only: %i[new create show]
end
