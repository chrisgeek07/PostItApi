Rails.application.routes.draw do
  get 'posts/index'
  get 'posts/new'
  get 'posts/create'
  get 'posts/edit'
  get 'posts/update'
  get 'posts/show'
  get 'users/new'
  get 'users/create'
  get 'users/show'

  namespace :api do 
    namespace :v1 do
      resources :users do
        resources :posts
      end
    end
  end
end
