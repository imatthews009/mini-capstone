class ProductsController < ApplicationController
    @product = Product.first
    render "single_product.html.erb"
end
