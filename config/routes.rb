Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :sellers
  resources :inventory_items do
  	resources :purchase_recipts
  end
  resources :payments do
  	put 'clear' => 'payments#cleared'
  end

  root :to => 'inventory_items#index'
  get 'inventory_items/:id/purchase' => 'inventory_items#purchase'
  post 'inventory_items/:id/store' => 'inventory_items#store'
end
