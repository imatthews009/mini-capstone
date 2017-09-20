class OrdersController < ApplicationController
    

    def create
        #takes all carted products for the current user where the status is carted. Then loops through each carted product to add the price to the created subtotal varible. Then add new variables for tax and total. Create new order using all variables. Update carted product status to purchased and put in order id. Redirect to the order page by id.
        @carted_products = current_user.carted_products.where(status: "carted")
        subtotal = 0
        @carted_products.each do |carted_prods|
            subtotal += carted_prods.quantity + carted_prods.product.price
        end
        tax = subtotal * 0.09
        total = subtotal + tax

        order = Order.create(
            user_id: current_user.id,
            subtotal: subtotal,
            tax: tax,
            total: total)

        @carted_products.update(status: "purchased", order_id: order.id)
        redirect_to "/orders/#{order.id}"
        flash[:primary] = "Successfully purchased"
    end

    def show
        @order = Order.find_by(id: params[:id])
        
    end
end
