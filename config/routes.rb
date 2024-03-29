# encoding: UTF-8
SocialStream::Application.routes.draw do
  devise_for :users, :controllers => {:omniauth_callbacks => 'omniauth_callbacks'}

  #resurce :infografics
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

     get 'infographics/upload' => 'infographics#upload'
     post 'infographics/upload' => 'infographics#doUpload'

     get 'infographics/:id/rating' => 'infographics#setRating'
     get 'infographics/:id/comments' => 'infographics#addComment'

     get 'infographics/categories' => 'infographics#categories'
     get 'infographics' => 'infographics#index'
     get 'infographics/top' => 'infographics#top'
     get 'infographics/new' => 'infographics#new'
     get 'infographics/:id/' => 'infographics#get'
     match 'infographics/search/:query' => 'infographics#search'
     match 'infographics/categories' => 'infographics#categories'
     match 'infographics/categories/:category_id/top' => 'infographics#byCategoryTop'
     match 'infographics/categories/:category_id/new' => 'infographics#byCategoryNew'


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
