class StorefrontController < ApplicationController
  def index
   if params[:search]
    @products = Product.search_by_name_or_description(params[:search]).paginate(:page => params[:page], :per_page => 9)
    if @products.empty?
     flash.now[:notice] = "No result found for '#{params[:search]}', showing all products."
     @products = Product.all.paginate(:page => params[:page], :per_page => 9)
    end
   elsif params[:category_id]
    @category = Category.find(params[:category_id])
    @products = Product.where(category_id: @category.id).paginate(:page => params[:page], :per_page => 9)

   elsif params[:show_all]
    @products = Product.all

   else
    @products = Product.all.paginate(:page => params[:page], :per_page => 9)
   end


  end

  def about
  end
end
