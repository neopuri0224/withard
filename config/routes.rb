Rails.application.routes.draw do
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  root to: 'static_pages#top'
  get 'static_pages/top'
  get 'users/search' => 'users#search'
  devise_for :users, controllers: {
        registrations: 'users/registrations',
      }
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :categories, only:[:index], shallow: true do
    resources :users, except:[:new,:create] do
      member do
        get :following, :followers
      end
    end
  	resources :posts, only:[:destroy]
  end
  resources :posts, only:[:index, :create]
  resources :user_steps
  resources :relationships, only: [:create, :destroy]
  resources :messages, :only => [:create]
  resources :rooms, :only => [:create, :show, :index]
  resource :redis, only: %i[show]
end
