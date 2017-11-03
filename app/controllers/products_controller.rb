class ProductsController < ApplicationController
    before_action :authenticate_admin!, except: [:index, :show, :search]
    
    def index
        
        @products = Product.all

        sort_att = params[:sort] 
        price_att = params[:price]
        random = params[:show]
        if sort_att
            @products = Product.all.order(sort_att)
        end
        if params[:discount]
            @products = Product.where("price <= ?", "5")
        end
        if random
            @products = Product.order("RANDOM()").limit(1)
        end

        if params[:category]
            selected_cat = Category.find_by(title: params[:category])
            @products = selected_cat.products
        end
        render "index.html.erb"
    end

    def new
        @product = Product.new
        render "new.html.erb"
    end

    def create
        @product = Product.new({name: params[:name], price: params[:price], description: params[:description], supplier_id: 1})

        if @product.save
        @image = Image.new({url: params[:image], product_id: 1})
        flash[:primary] = "Successfully saved new products"
        redirect_to "/products/#{@product.id}"
        else
            render "new.html.erb"
        end
    end

    def show
        @product = Product.find_by(id: params[:id])
        # making a category which returns all catagories in a hash associated with the selected product
        @category = @product.categories
        render "show.html.erb"

    end

    def edit
        @product = Product.find_by(id: params[:id])
        render "edit.html.erb"
    end

    def update
        @product = Product.find_by(id: params[:id])
        @product.name = params[:name]
        @product.description = params[:description]
        @product.price = params[:price]
        
        
        if @product.save
            flash[:success] = "Successfully update product"
            redirect_to "/products/#{@product.id}"
        else 
            render "edit.html.erb"
        end
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
