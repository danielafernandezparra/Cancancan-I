Rails.application.routes.draw do

  get 'pages/dashboard'
  # get 'pages/update/:user_id', to: "user#update_role", as: "user_update_role"
  # delete 'pages/destroy/:user_id', to: "user#destroy_role", as: "user_destroy_role"
  # get 'user/change_role/:id', to: "user#change_role", as: "user_change_role"
  resources :user do
    resources :users, only: [:destroy, :update]
  end

	resources :posts do
		resources :comments, only: [:create, :destroy]
	end

	devise_for :users, controllers: {
		sessions: 'users/sessions',
		registrations: 'users/registrations'

	}

	root 'posts#index'
# For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
