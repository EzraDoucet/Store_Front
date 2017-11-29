class OrdersController < ApplicationController

  include CurrentCart
  before_action :authenticate_user!
  before_action :set_cart, only: [:new, :create]


  def show

  end

  def new
   if @cart.line_items.empty?
    redirect_to shop_url, notice: 'Your Cart is Empty.'
    return
   end
   @order = Order.new
   @order.user_id = current_user.id
  end
end
