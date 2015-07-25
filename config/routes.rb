Rails.application.routes.draw do
 
  devise_for :users
 resources :contacts
  #get '/' => 'pages#home'
 #root 'pages#home'

 get '/about' => 'pages#about'
#root :to => 'devise/sessions#new'


#root :to => redirect("/users/sign_in")

#devise_scope :user do
 # root :to => "devise/sessions#new"
#end
 devise_scope :user do
 get '/' => 'devise/sessions#new'
 end
 post '/thanks' => 'pages#thanks'

 
#map.resources :contacts, :collection => { :check_email => :get }
#map.check_email "contacts/check_email", :controller => "contacts", :action => "check_email"
#map.resources :contacts

 get '/check_email' => 'contacts#check_email',  :defaults => { :format => 'json' }
# match 'check_mail' => "contacts#check_mail"
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  # root 'welcome#index'

  # Example of regular route:
  #   get 'products/:id' => 'catalog#view'

  # Example of named route that can be invoked with purchase_url(id: product.id)
  #   get 'products/:id/purchase' => 'catalog#purchase', as: :purchase

  # Example resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Example resource route with options:
  #   resources :products do
  #     member do
  #       get 'short'
  #       post 'toggle'
  #     end
  #
  #     collection do
  #       get 'sold'
  #     end
  #   end

  # Example resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Example resource route with more complex sub-resources:
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', on: :collection
  #     end
  #   end

  # Example resource route with concerns:
  #   concern :toggleable do
  #     post 'toggle'
  #   end
  #   resources :posts, concerns: :toggleable
  #   resources :photos, concerns: :toggleable

  # Example resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end
end
