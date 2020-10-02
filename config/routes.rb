Rails.application.routes.draw do

  namespace :api, defaults: { format: :json } do
  	namespace :v1 do
  		resources :contacts, only: [:create]
  	end
  end
	
  scope "(:locale)", locale: /#{I18n.available_locales.join("|")}/ do
  	get 'contacts/:locale' => 'contacts#new'
  	
  	root :to => "contacts#new"
	end

  match "*path", to: "contacts#new", via: :all
end
