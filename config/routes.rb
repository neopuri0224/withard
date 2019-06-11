Rails.application.routes.draw do
  root to: 'static_pages#top'
  get 'static_pages/top'
  devise_for :users, controllers: {
        registrations: 'users/registrations',
      }
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :category, only:[:index], shallow: true do
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
end
