Rails.application.routes.draw do
  resources :items
  get 'homes/show'
	namespace :api do
		namespace :v1 do 
		  resources :progonories,format: :json
		end
	end
	devise_for :users
	resources :employees,only: [:index]
	resources :comments
	resources :categories
	resources :articles
	resources :products
	resources :homes, only: [:show]
  root to: "homes#show"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
