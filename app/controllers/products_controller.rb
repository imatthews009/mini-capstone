class ProductsController < ApplicationController
    def single_product
        @product = Product.first
        render "single_product.html.erb"
    end
    def all_products
        @products = Product.all 
        render "all_products.html.erb"
    end
end
