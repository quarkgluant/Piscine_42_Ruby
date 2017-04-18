Rails.application.routes.draw do
  root 'cheat#convention'
  get 'convention' => 'cheat#convention'
  get 'console' => 'cheat#console'
  get 'ruby' => 'cheat#ruby'
  get 'rails' => 'cheat#rails'
  get 'ruby_concepts' => 'cheat#ruby_concepts'
  get 'ruby_numbers' => 'cheat#ruby_numbers'
  get 'ruby_strings' => 'cheat#ruby_strings'
  get 'ruby_arrays' => 'cheat#ruby_arrays'
  get 'ruby_hashes' => 'cheat#ruby_hashes'
  get 'rails_folder_structure' => 'cheat#rails_folder_structure'
  get 'rails_commands' => 'cheat#rails_commands'
  get 'rails_erb' => 'cheat#rails_erb'
  get 'editor' => 'cheat#editor'
  get 'help' => 'cheat#help'
  get 'quick_search' => 'cheat#quick_search'


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
