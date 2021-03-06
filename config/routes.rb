OnebacklogCom::Application.routes.draw do
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".
  devise_for :users, :path => 'accounts'

  get '/onebacklog/', to: 'backlog_items#index', as: 'backlog'
  get '/onebacklog/:backlog_item_id', to: 'backlog_items#show', as: 'backlog_item'
  put '/onebacklog/:backlog_item_id', to: 'backlog_items#update'
  get '/onebacklog/:backlog_item_id/delete', to: 'backlog_items#destroy', as: 'destroy_backlog_item'
  get '/checklist_items/:checklist_item_id/toggle', to: 'checklist_items#toggle', as: 'toggle_checklist_item'
  get '/checklist_items/:checklist_item_id/delete', to: 'checklist_items#destroy', as: 'destroy_checklist_item'
  put '/checklist_items/:checklist_item_id/update', to: 'checklist_items#update', as: 'update_checklist_item'
  post '/onebacklog/:backlog_item_id/checklist/create', to: 'checklist_items#create', as: 'create_checklist_item'
  post '/onebacklog/:backlog_item_id/discussion/create', to: 'backlog_items#comment', as: 'create_comment'

  # You can have the root of your site routed with "root"
  root 'welcome#index'

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
