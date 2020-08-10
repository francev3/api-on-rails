Rails.application.routes.draw do
  devise_for :users, skip: %i[regitrations sessions passwords]

  namespace 'api' do
    namespace 'v1' do
    
      devise_scope :user do 
        post '/login', to: 'sessions#create'
        delete '/logout', to: 'sessions#destroy'
      end

      get 'user/:id', to: 'user#show'
      put 'user/:id', to: 'user#update'
    
    end
  end



end
