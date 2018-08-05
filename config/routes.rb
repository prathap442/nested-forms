Rails.application.routes.draw do
	devise_for :users
	resources :employees,only: [:index]
	resources :comments
	resources :categories
	resources :articles
	root "categories#index"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
