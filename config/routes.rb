Rails.application.routes.draw do
  devise_for :podcasts, skip: [:registrations]
  as :podcast do
    get 'podcasts/edit' => 'devise/registrations#edit', :as => 'edit_podcast_registration'
    put '/podcasts(.:format)' => "devise/registrations#update", as: 'podcast_registration'
    patch '/podcasts(.:format)' => 'devise/registrations#update'
  end
  
  resources :podcasts, only: [:index, :show] do
    resources :episodes
  end
  
  authenticated :podcast do
    root 'podcasts#dashboard', as: "authenticated_root"
  end
  
  root 'pages#index'
  
  get 'about', to: 'pages#about'

end
