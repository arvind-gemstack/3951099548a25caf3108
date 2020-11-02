Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  scope module: :api, path: :api do
  	scope module: :v1, path: "" do 
	  	resources :user#, only: [:index]
	  	get '/users', to: 'user#index' 
	  	get '/typeahead/:input' ,to: "user#search", as: "typeahead"
	  	# put '/user/:id', to: 'users#update'
	  	# delete '/user/:id', to: 'users#destroy'
	  	# post '/user/' , to: "users#create"
   	end
	end
end
