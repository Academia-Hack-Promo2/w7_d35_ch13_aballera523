Rails.application.routes.draw do
  get 'digg/notices' => 'feeds#digg_notices'
  get 'digg/titles' => 'feeds#digg_titles'
  get 'digg/authors' => 'feeds#digg_authors'

  get 'reddit/notices' => 'feeds#reddit_notices'
  get 'reddit/titles' => 'feeds#reddit_titles'
  get 'reddit/authors' => 'feeds#reddit_authors'

  get 'mashable/notices' => 'feeds#mashable_notices'
  get 'mashable/titles' => 'feeds#mashable_titles'
  get 'mashable/authors' => 'feeds#mashable_authors'
  
  get 'feeds/notices' => 'feeds#feed_notices'
  get 'feeds/titles' => 'feeds#feed_titles'
  get 'feeds/authors' => 'feeds#feed_authors'


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
