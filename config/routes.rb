Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :users
      resources :practices do
        post :bookmark, on: :collection
      end
      
      resources :sessions do
        post :sign_in, on: :collection
        post :sign_out, on: :collection
      end
    end
  end
end
