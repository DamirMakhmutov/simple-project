Rails.application.routes.draw do
  devise_for :users

  root to: 'posts#index'

  resources :posts, only: %i(index show) do
    resources :comments
  end

  resources :user_posts do
    resources :comments
  end
end
