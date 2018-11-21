Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  post 'notification', to: 'notifications#receive'
  get 'notification', to: 'notifications#index'
  root to: 'notifications#sanitycheck'
end
