Rails.application.routes.draw do
  get "/single_product" => "products#single_product"
  get "/all_products" => "products#all_products"
end
