RailsBootstrap::Application.routes.draw do
  resources :admins

  devise_for :users, controllers: {omniauth_callbacks: "users/omniauth_callbacks"} 
  #   devise_scope :user do
#    get 'sign_out', :to => 'devise/sessions#destroy', :as => :destroy_user_session
# end

  resources :contact_us

  resources :preview_sign_ups

  resources :itineraries do
    collection do
      get 'listing/:id', :to => 'itineraries#listing'
    end
  end

  resources :invited_to_trips do
    collection do
      post 'invite'
      post 'invite/:id', :to => 'invited_to_trips#invite'
    end
  end
  resources :orders
  resources :friend_lists do
    collection do
      post 'invite_friend'
      post 'invite_friend/:id', :to => 'friend_lists#invite_friend'
    end
  end
  resources :galleries
  resources :categories
  resources :destinations  
  resources :user_wants
  resources :merchants
  resources :products
  resources :product_price_lists
  # resources :user_shopping_carts
  resources :trips do
    collection do
      post 'update_trip_date/:id', :to => 'trips#update_trip_date'
    end
  end
  resources :product_in_feeds  

  resources :feeds  
  resources :trending_tags
  resources :feeds do
      collection do
      get 'listing/:id', :to => 'feeds#listing'
      post 'listing/:id', :to => 'feeds#listing'
      get 'location/:id', :to => 'feeds#location'
      
      post 'create_feed'
   end
  end
  resources :products do
	  collection do
      get 'shop'
	    get 'shop/:id' , :to => 'products#shop'
	    get 'want/:id' , :to => 'products#want'
      get 'item/:id' , :to => 'products#item'
      get 'preview/:id', :to => 'products#preview'
      post 'create_product'
	  end
  end
  resources :user_shopping_carts do
    collection do
      get 'cart' , :to => 'user_shopping_carts#cart'
      get 'clearcart', :to => 'user_shopping_carts#clearcart'
      get 'buy', :to => 'user_shopping_carts#buy'
      get 'thankyou', :to => 'user_shopping_carts#thankyou'
      get 'receive', :to => 'user_shopping_carts#receive'
      get 'cancel', :to => 'user_shopping_carts#cancel'
      post 'change_quantity', :to => 'user_shopping_carts#change_quantity'
      get 'empty', :to => 'user_shopping_carts#empty'
      get 'remove/:id', :to => 'user_shopping_carts#remove'
    end
  end
  # resources :products, :only => [:shop], :defaults => { :format => 'json'}
  resources :user_details do
    collection do
      get 'trips' , :to => 'user_details#trips'
      get 'settings/:id', :to => 'user_details#settings'
    end
  end

  match 'display/:id' => 'visitors#display', via: [:get, :post]
  match 'new' => 'visitors#new', via: [:get]
  match 'new' => 'visitors#landingsignup', via: [:get, :post]
  match 'account' => 'visitors#account', via: [:get]
  match 'aboutus' => 'visitors#aboutus', via: [:get]
  match 'contact' => 'contact_us#contact', via: [:get, :post]
  root :to => 'preview#landing'
  # devise_for :users, :controllers => {:registrations => "registrations"} do
  #   get "/users/sign_up" => "authentications#index"
  #   get "/users/sign_in" => "authentications#index"
  # end
  
#  get "user_feeds/home"  resources :users, only: [:show, :edit, :update]
end
