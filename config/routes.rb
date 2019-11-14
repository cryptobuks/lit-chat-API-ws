Rails.application.routes.draw do

  namespace :api do 
    namespace :v1 do 

      resources :users, only: %i[index update destroy show]
      resources :chats, only: %i[index show create destroy]
      resources :user_chats, only: %i[create update]
      resources :messages, only: %i[create update destroy]
      resources :session, only: %i[create]
      post '/register', to: "users#create"
      get '/auth/:user_id/:token', to: "session#auth"
      
    end
  end

end
