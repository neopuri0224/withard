Rails.application.routes.draw do
  root to: 'static_pages#top'
  get 'static_pages/top'
  get 'users/category'
  devise_for :users, controllers: {
        registrations: 'users/registrations',
      }
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :users do
  	resources :posts, only:[:destroy]
  end
  resources :posts, only:[:index, :create]
  resources :user_steps
end
