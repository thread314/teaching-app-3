Rails.application.routes.draw do

  get 'cardstates/edit'
	resources :cardstates

  get 'cards/new'
  get 'cards/show'
  get 'cards/edit'

  #get 'users/new'
	#get 'users/index'
	resources :users
	get '/users/:id/study', to: 'users#study', as: 'study'

  get 'static_pages/home'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'static_pages#home'
end
