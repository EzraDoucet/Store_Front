class CartsController < ApplicationController
  def edit
   include CurrentCart
   before_action :set_cart
  end
end
