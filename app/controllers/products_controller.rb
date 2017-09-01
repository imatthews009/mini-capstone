class ProductsController < ApplicationController
    def single_product
        @product = Product.first
        render "single_product.html.erb"
    end
    def index
        @products = Product.all 
        render "index.html.erb"
    end

    def new
        render "new.html.erb"
    end

    def create
        @product = Product.new({name: params[:name], price: params[:price], image: params[:image], description: params[:description]})
        @product.save
        render "create.html.erb"
    end

    def show
        @product = Product.find_by(id: params[:id])
        render "show.html.erb"
    end
end
