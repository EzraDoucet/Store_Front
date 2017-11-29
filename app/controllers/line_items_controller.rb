class LineItemsController < ApplicationController
 include CurrentCart
 before_action :set_cart

 def create
  product = Product.find(params[:product_id])
  @line_item = @cart.line_items.build(product: product, price: product.price)

  if @line_item.save
   flash[:notice] = "#{product.name} was added to your cart."
   redirect_to shop_path
  else
   flash[:notice] = "Coudn't add #{product.name} to your cart."
   redirect_back(fallback_location: shop_path)
  end
 end

 def destroy
   # @line_item.destroy
   #  respond_to do |format|
   #    format.html { redirect_to products_url, notice: 'Item Deleted From Cart.' }
   #    format.json { head :no_content }
   #  end

  if @line_item.destroy
   session[:line_item_id] = nil
   flash[:notice] = "Your Item Was Successfully Destroyed"
   redirect_to edit_cart_path
  else
   flash[:notice] = "Couldn't Delete Your Item...Sorry!"
   redirect_to edit_cart_path
  end
 end

 # has_attached_file :avatar, styles: {medium: "300x300#", thumb: "100x100#{}"}, default_url: "/images/:style/missing.png"
 #  validates_attachment_content_type :avatar, content_type: /\Aimage\/.*\z/

 # def product_params
 #   params.require(:product).permit(:name, :price, :quantity, :description, :category_id, :brand_id, :avatar)
 # end
end
