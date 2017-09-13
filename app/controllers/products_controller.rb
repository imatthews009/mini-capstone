class ProductsController < ApplicationController
    
    def index
        @products = Product.all
        
        sort_att = params[:sort] 
        price_att = params[:price]
        random = params[:show]
        if sort_att
            @products = Product.all.order(sort_att)
        end
        if price_att
            @products = Product.where("price < ?", price_att)
        end
        if random
            @products = Product.order("RANDOM()").limit(1)
        end
        render "index.html.erb"
    end

    def new
        render "new.html.erb"
    end

    def create
        @product = Product.new({name: params[:name], price: params[:price], description: params[:description]})
        @product.save
        @image = Image.new({url: params[:image], product_id: 1})
        flash[:primary] = "Successfully saved new products"
        redirect_to "/products/#{@product.id}"
    end

    def show
        @product = Product.find_by(id: params[:id])
        render "show.html.erb"
    end

    def edit
        @product = Product.find_by(id: params[:id])
        render "edit.html.erb"
    end

    def update
        @product = Product.find_by(id: params[:id])
        @product.update({name: params[:name], price: params[:price], image: params[:image], description: params[:description], in_stock: params[:in_stock]})
        @product.save
        flash[:success] = "Successfully update product"
        redirect_to "/products/#{@product.id}"
    end
    def destroy
        @product = Product.find_by(id: params[:id])
        @product.destroy
        flash[:warning] = "Successfully destroyed product"
        redirect_to "/products"
    end
    def search
        search_term = params[:search]
        @products = Product.where("name LIKE ?", "%#{search_term}%")
        render "index.html.erb"
    end
end
