Rails.application.routes.draw do
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  post 'notifications', to: 'notifications#create'
  post 'register', to: 'notifications#register'
  get 'notifications', to: 'notifications#index', as: 'notifications_index'
  root to: 'notifications#home'
end
