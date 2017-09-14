class ImagesController < ApplicationController
    def new
        @product = Product.find_by(id: params[:product_id])
        render "new.html.erb"
    end

    def create
        product_id = params[:product_id]
        image = Image.create({
            url: params[:url],
            product_id: product_id
            })
        redirect_to "/products/#{product_id}"
        
    end
end
