Rails.application.routes.draw do
  get "/all_products" => "products#single_product"
end
