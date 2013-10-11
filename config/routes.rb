MockRws::Application.routes.draw do
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
 root to: 'application#index'

#Query Routes
 get 'RaveWebServices/CodingContext/:context_uuid/Query' => 'query#create', as: :query_open
 get 'RaveWebServices/Query/notfound*additional' => 'query#query_not_found', as: :query_not_found
 get 'RaveWebServices/Query/:query_uuid/Cancel' => 'query#cancel', as: :query_cancel
 get 'RaveWebServices/Query/:query_uuid/Forward' => 'query#forward', as: :query_forward
 get 'RaveWebServices/Query/:query_uuid/Answer' => 'query#answer', as: :query_answer
 get 'RaveWebServices/Query/:query_uuid/Close' => 'query#close', as: :query_close
 get 'RaveWebServices/Query/:query_uuid/Re-query' => 'query#requery', as: :query_requery

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
