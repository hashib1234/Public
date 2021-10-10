Rails.application.routes.draw do
  devise_for :users, controllers: {
        sessions: 'users/sessions',omniauth_callbacks: 'users/omniauth_callbacks'
          }
     devise_scope :user do
      authenticated :user do
        root 'pages#user_home', as: :authenticated_root
      end


		  unauthenticated do
		    root 'devise/sessions#new', as: :unauthenticated_root
		  end
      match 'verify_otp', to:'users/sessions#verify_otp',via:[:patch]  
		end 

       
     

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  		
  		match '/admin_home',to: 'admins#admin_home',via:[:get,:post], :as => :admin_home
  		match '/users/:id',to: 'pages#user_home',via:[:get,:post]

      match 'users/:id' => 'admins#destroy', :via => :delete, :as => :admins_destroy_user
      
  		get 'user_profile',  to: 'profiles#show'
  		
  		resources :profiles, only: [:edit, :update]

  		get 'component', to: 'components#component'

  		get 'users_revokeadmin', to: 'admins#revoke_admin'
  		get 'users_makeadmin', to: 'admins#make_admin'
      get 'users_edituser', to: 'admins#edit', :as => :edit_user
      post 'users_update/:id', to:'admins#update',:as => :admins_update_user
      match 'admins_create_user' ,to: 'admins#create_user',via:[:get,:post], :as => :create_user



    
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
      
      # match '/admin_home',to: 'admins#admin_home',via:[:get,:post], :as => :admin_home
      # match '/users/:id',to: 'pages#user_home',via:[:get,:post]

      get 'user_profile',  to: 'profiles#show'
      
      resources :profiles, only: [:edit, :update]
      post '/upload_image', to: 'profiles#upload_image'
      get 'component', to: 'components#component'

      get 'profiles/upload'
      ["covid-vaccination","blood-bank","covid-result"].each do |parameters|
      get 'component/:pages', to: 'components#component' ,:as => parameters.to_sym, :defaults => { :pages => parameters }
      
     end

     resources :conversations, only: [:create]
     resources :messages
     
end
