Rails.application.routes.draw do

  get 'cards/new'
  get 'cards/show'
  get 'cards/edit'
  get 'users/new'

  get 'static_pages/home'
  get 'static_pages/help'
	get 'static_pages/about'

	get 'users/index'
	resources :users
	get 'users/:id/study' => 'users#study'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'static_pages#home'
end
