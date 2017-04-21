Rails.application.routes.draw do
  resource :session, only: [:create, :new, :destroy]
  resources :users, only: [:new, :create, :show] do
    get '/activate', to: 'users#activate', as: 'activate'
  end



  resources :bands do
    resources :albums, only: [:new]
  end
  resources :albums, except: [:new, :index] do
    resources :tracks, only: [:new]
  end
  resources :tracks, except: [:new, :index] do
    resources :notes, only: [:create]
  end
  resources :notes, only: [:destroy]

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
