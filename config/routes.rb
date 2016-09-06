Rails.application.routes.draw do
  get 'meters/new'

  post '/location', to: 'location#create' 

 

  
  match 'refresh-data', :to => 'data_downloader#refresh_kml', :via => :post
  match 'reload-db', :to => 'meters#reload_data', :via => :post
  get 'location/history', to:  'location#getHistory'
  
  get 'meters/asJSON', :to => 'meters#locations'

  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  #Twitter Tutorial
  
  #READ THIS SCOTT!!! http://www.orhancanceylan.com/rails-twitter-and-facebook-authentications-with-omniauth-and-devise/

  get 'admin', to: 'meters#index' # NOTE: this needs to be above the welcome routes
  root 'welcome#login'
  get 'auth/:provider/callback', to: 'sessions#create'
  get 'welcome', to: 'welcome#index'
  get 'signout', to: 'sessions#destroy'
  get 'welcome/aboutUs', to: 'welcome#aboutUs'
  get 'welcome/login', to: 'welcome#login'
  get "*any_path", to: 'welcome#login'

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
