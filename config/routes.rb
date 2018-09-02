Rails.application.routes.draw do

    
  resources :complains

  post 'admins/login', to: 'admins#login'
  post 'admins/register', to: 'admins#register'

  post 'login', to: 'users#login'

  post 'register', to: 'users#register'

  get 'users/index'
  get 'admins/index'
end
