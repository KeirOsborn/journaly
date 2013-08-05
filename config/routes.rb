Journaly::Application.routes.draw do

  root :to => "users#new"

  resources :trips do #gives the 7 restful routes #see rake routes
    resources :places do
      resources :journal_entries
      match '/media' => 'instagram#media' , :via => :get
      match '/media' => 'instagram#media' , :via => :post
      match '/' => 'instagram#add' , :via => :post
      match '/images/add/:id', to: 'instagram#add_image'
    end
  end

  resources :users do
    match 'user' => 'users#show'
  end

  #resources :instagram
  match 'instagram' => 'instagram#show' , :via => :get
  match 'instagram/link' => 'instagram#link' , :via => :get
  match 'instagram/media' => 'instagram#media' , :via => :get
  match 'instagram/link' => 'instagram#add' , :via => :post

  resources :map do
    match 'map' => 'map#index'
  end

    match 'twitter/logined' => 'twitter#logined'

  resources :twitter do
    match 'twitter' => 'twitter#index'
  end

  resources :transport


  # The priority is based upon order of creation:
  # first created -> highest priority.

  # Sample of regular route:
  #   match 'products/:id' => 'catalog#view'
  # Keep in mind you can assign values other than :controller and :action

  # Sample of named route:
  #   match 'products/:id/purchase' => 'catalog#purchase', :as => :purchase
  # This route can be invoked with purchase_url(:id => product.id)

  # Sample resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Sample resource route with options:
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

  # Sample resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Sample resource route with more complex sub-resources
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', :on => :collection
  #     end
  #   end

  # Sample resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end

  # You can have the root of your site routed with "root"
  # just remember to delete public/index.html.
  # root :to => 'welcome#index'

  # See how all your routes lay out with "rake routes"

  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.
  # match ':controller(/:action(/:id))(.:format)'
end
