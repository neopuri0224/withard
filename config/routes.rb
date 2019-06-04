Rails.application.routes.draw do
  root to: 'static_pages#top'
  get 'static_pages/top'
  devise_for :users, controllers: {
        registrations: 'users/registrations',
      }
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :users
  resources :user_steps
end
