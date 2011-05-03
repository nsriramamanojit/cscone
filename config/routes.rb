Cscone::Application.routes.draw do

#  resources :district_managers
#  resources :district_engineers
  
  namespace :admin do resources :bulk_mails do
  get 'mail_to_all',:on=>:collection
  get 'mail_to_district',:on=>:collection
  post 'vle_mailing' , :on=>:collection
end
 end

  resources :insurance_transactions do
  get 'export',:on=>:collection
end

 

  namespace :admin do resources :insurance_premia end
  
    namespace :admin do resources :reports do
      get 'banking',:on=>:collection
      get 'insurance',:on=>:collection
      get 'insurance_transaction',:on=>:collection
      get 'banking_transaction',:on=>:collection
      post 'banking_report',:on=>:collection
      post 'banking_transaction_report',:on=>:collection
      post 'insurance_report',:on=>:collection
      post  'insurance_transaction_report',:on=>:collection
    end
   end
  namespace :admin do resources :premia do
 get 'export',:on=>:collection
end
 end

  resources :transactions do
     get 'export',:on=>:collection
   end

  namespace :admin do resources :account_types do
 get 'export',:on=>:collection
end
end

  

  resources :insurances do
 get 'export',:on=>:collection
end

  resources :bankings do
     get 'export',:on=>:collection
     get 'edit_profile',:on=>:collection
     get 'show_profile',:on=>:collection
   end
 

  namespace :admin do resources :vle_representatives do
      get 'export',:on=>:collection
      get 'vle_user',:on=>:collection
      get 'vle_document',:on=>:collection
      get 'vle_report',:on=>:collection
       post 'load_bidding_zones',:on=>:collection
          post 'load_districts',:on=>:collection
          post 'load_csc_blocks',:on=>:collection
          post 'load_vle_representatives',:on=>:collection
        get 'disable_representative',:on=>:collection
        get 'update_vle_representative',:on=>:collection
        get 'vle_profile',:on=>:collection
         get 'edit_profile',:on=>:collection
        post 'csv_import' , :on=>:collection
         get 'upload', :on=>:collection 
         get 'reset_password',:on=>:collection
          get 'upload_password',:on=>:collection
          get 'report',:on=>:collection
          get 'bulk_mailing' , :on=>:collection
          


      end
  end

  namespace :admin do
       resources :vle_documents do
           get 'export',:on=>:collection
       end
        end

  namespace :admin do
      resources :csc_blocks do
          get 'export',:on=>:collection
          post 'load_bidding_zones',:on=>:collection
          post 'load_districts',:on=>:collection
          end
      end

  namespace :admin do
  resources :districts do
            get 'vle_document',:on=>:collection
      post 'load_bidding_zones',:on => :collection
  get 'export', :on=>:collection
       end
end
  namespace :admin do
  resources :bidding_zones do
    get 'export',:on=>:collection
    end
   end

  namespace :admin do
      resources :states do
          get 'export' ,:on=>:collection
           post 'csv_import', :on=>:collection
  get 'upload', :on=>:collection 
       end

      end
  
    resources :user_sessions
    
 namespace :admin do
 resources :users do
  get 'export',:on=>:collection
    end

  end
  resource :accout,:controller=>'users'
  match 'login' => "user_sessions#new",      :as => :login
  match 'logout' => "user_sessions#destroy", :as => :logout
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
   root :to => "admin/districts#index"

  # See how all your routes lay out with "rake routes"

  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.
   match ':controller(/:action(/:id(.:format)))'
end

