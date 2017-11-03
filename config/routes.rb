Rails.application.routes.draw do

  root to: "products#index"

  get "/single_product" => "products#single_product"
  get "/products" => "products#index"

  get "/products/new" => "products#new"
  post "/products" => "products#create"
  
  get "/products/:id" => "products#show"

  get "/products/:id/edit" => "products#edit"
  patch "/products/:id" => "products#update"

  delete "/products/:id" => "products#destroy"

  post '/search' => 'products#search'

  get "/products/:product_id/images/new" => "images#new"
  post "/products/:product_id/images" => "images#create"

  get "/signup" => "users#new"
  post "/users" => "users#create"

  get "/login" => "sessions#new"
  post "/login" => "sessions#create"
  get "/logout" => "sessions#destroy"

  
  post "/orders" => "orders#create"
  get "/orders/:id" => "orders#show"

  post "/cart" => "carted_products#create"
  get "/cart" => "carted_products#index"
  delete "/cart/:id" => "carted_products#destroy"
end
