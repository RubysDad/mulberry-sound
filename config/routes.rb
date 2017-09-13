Rails.application.routes.draw do
  devise_for :podcasts
  root 'pages#index'
  
  resources :podcasts, only: [:index, :show] do
    resources :episodes
  end
end
