class OrdersController < ApplicationController
    

    def create
        @product = Product.find_by(id: params[:product_id])
        @order = Order.new({user_id: current_user.id, product_id: params[:product_id], quantity: params[:quantity], subtotal: @product.price, tax: @product.tax, total: @product.total})
        @order.save
        flash[:primary] = "Successfully saved new order"
        redirect_to "/orders/#{@order.id}"
    end

    def show
        @order = Order.find_by(id: params[:id])
        @product = Product.find_by(id: @order.product_id)
    end
end
