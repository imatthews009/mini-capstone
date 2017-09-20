class CartedProductsController < ApplicationController
    def create
        #taken from products show page form. Hidden input for product_id and normal input for quantity. redirect to /cart to show the index page.
        carted_product = CartedProduct.create(user_id: current_user.id , product_id: params[:product_id], quantity: params[:quantity] , status: "carted" )
        flash[:primary] = "Successfully added product to cart"
        redirect_to "/cart"
    end

    def index
        #setting index only if current user has carted products. Redirecting to home page if there are no products. set variable that shows all carted products related to the current user and has a carted status.
        if current_user && current_user.carted_products.where(status: "carted").any?
            @carted_products = CartedProduct.where(user_id: current_user.id, status: "carted")
            render "index.html.erb"
        else
            flash[:warning] = "No items in cart"
            redirect_to "/products"
        end                
    end
    #changes the status variable to removed and redirect to cart. params id is taken from url.
    def destroy
        carted_product = CartedProduct.find(params[:id])
        carted_product.update(status: "removed")
        flash[:success] = "product removed"
        redirect_to "/cart"
    end
end
