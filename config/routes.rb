Rails.application.routes.draw do
  
  namespace :api do 
    namespace :v1 do 

      resources :users, only: %i[index create update destroy show]
      resources :chats, only: %i[index show create destroy]
      resources :user_chats, only: %i[create update]
      resources :messages, only: %i[create update destroy]
      post '/login', to: "auth#login"
      patch '/reAuth', to: "auth#reAuth"

    end
  end

end
