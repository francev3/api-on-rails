Rails.application.routes.draw do
  devise_for :users, skip: %i[regitrations sessions passwords]
  devise_scope :user do 
    post '/login', to: 'sessions#create'
    delete '/logout', to: 'sessions#destroy'
  end


  get 'user/:id', to: 'user#show'
  put 'user/:id', to: 'user#update'

end
