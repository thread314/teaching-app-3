Rails.application.routes.draw do

  resources :cards, only: [:show, :new, :index]
  resources :levels, only: [:edit, :update]

	resources :users
	get '/users/:id/study', to: 'users#study', as: 'study'
  put 'cardstates/:id/update', to: 'cardstates#update'

  get 'static_pages/home'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'static_pages#home'
end
