class LineItemsController < ApplicationController
 include CurrentCart
 before_action :set_cart

 def create
  product = Product.find(params[:product_id])
  @line_item = @cart.add_product(product.id)

  if @line_item.save
   flash[:notice] = "#{product.name} was added to your cart."
   redirect_to shop_path
  else
   flash[:notice] = "Coudn't add #{product.name} to your cart."
   redirect_back(fallback_location: shop_path)
  end
 end

 def destroy

  @line_item = LineItem.find(params[:id])

  #  if @line_item.destroy
  #   flash[:notice] = 'Item Deleted From Cart.'
  #      redirect_to edit_cart_path
  #  else
  #   redirect_to edit_cart_path
  #  end
  # end

  @line_item.destroy
   respond_to do |format|
     format.html { redirect_to edit_cart_path, notice: 'Item Deleted From Cart.' }
     format.json { head :no_content }
   end
  end

 #  if @line_item.destroy
 #   session[:line_item_id] = nil
 #   flash[:notice] = "Your Item Was Successfully Destroyed"
 #   redirect_to edit_cart_path
 #  else
 #   flash[:notice] = "Couldn't Delete Your Item...Sorry!"
 #   redirect_to edit_cart_path
 #  end
 # end

end
