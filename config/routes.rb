Rails.application.routes.draw do
  devise_for :users
	resources :foods
	resources :meals
	root to: "storehouse#index"
end
