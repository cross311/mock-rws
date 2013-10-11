MockRws::Application.routes.draw do
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
 root to: 'documentation#index'

#Query Routes
 match 'RaveWebServices/CodingContext/error-rws:rws_code/Query/:query_uuid', to: 'error#index', as: :query_create_error, via: :all
 match 'RaveWebServices/CodingContext/error-query-edit:rws_code/Query/:query_uuid', to: 'query#create_edit_error', as: :query_create_edit_error, via: :all
 match 'RaveWebServices/CodingContext/:context_uuid/Query/:query_uuid', to: 'query#create', as: :query_create, via: :all

 match 'RaveWebServices/Query/error-rws:rws_code/*method', to: 'error#index', as: :query_edit_error, via: :all
 match 'RaveWebServices/Query/:query_uuid/*method', to: 'query#edit', as: :query_edit, via: :all

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
