MockRws::Application.routes.draw do
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
 root to: 'application#index'

#Query Routes
 get 'RaveWebServices/CodingContext/error-rws:rws_code/Query/:query_uuid' => 'error#index', as: :query_create_error
 get 'RaveWebServices/CodingContext/error-query-edit:rws_code/Query/:query_uuid' => 'query#create_edit_error', as: :query_create_edit_error
 get 'RaveWebServices/CodingContext/:context_uuid/Query/:query_uuid' => 'query#create', as: :query_create

 get 'RaveWebServices/Query/error-rws:rws_code/*method' => 'error#index', as: :query_edit_error
 get 'RaveWebServices/Query/:query_uuid/*method' => 'query#edit', as: :query_edit

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
