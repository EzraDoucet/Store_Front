class ProductsController < ApplicationController
  # before_action :authenticate_user!, except: [:index, :show]
  before_action :authenticate_admin!, except: [:index, :show]
  before_action :set_product, only: [:show, :edit, :update, :destroy]


  # GET /products
  # GET /products.json
  def index
    if params[:search]
    # @products = Product.all
    @products = Product.search_by_name_or_description(params[:search])
      if @products.empty?
        flash.now[:notice] = "No result found for '#{params[:search]}', showing all products."
        @products = Product.all
      end
    elsif params[:category_id]
      @category = Category.find(params[:category_id])
      @products = Product.where(category_id: @category.id)
    elsif params[:products]
      @products = Product.all
    else
      @products = Product.all
    end
  end

  # GET /products/1
  # GET /products/1.json
  def show
  end

  # GET /products/new
  def new
    @product = Product.new
  end

  # GET /products/1/edit
  def edit
  end

  # POST /products
  # POST /products.json
  def create
    @product = Product.new(product_params)

    respond_to do |format|
      if @product.save
        format.html { redirect_to @product, notice: 'Product was successfully created.' }
        format.json { render :show, status: :created, location: @product }
      else
        format.html { render :new }
        format.json { render json: @product.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /products/1
  # PATCH/PUT /products/1.json
  def update
    respond_to do |format|
      if @product.update(product_params)
        format.html { redirect_to @product, notice: 'Product was successfully updated.' }
        format.json { render :show, status: :ok, location: @product }
      else
        format.html { render :edit }
        format.json { render json: @product.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /products/1
  # DELETE /products/1.json
  def destroy
    @product.destroy
    respond_to do |format|
      format.html { redirect_to products_url, notice: 'Product was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    # def authenticate_admin!
    #   unless current_user.try(:admin?)
    #     raise SecurityError
    #     # Let them do stuff
    #   end
    # end

    # rescue_from SecurityError do
    #   redirect_back(fallback_location: root_path, notice: "You don't have access to that!")

    # end

    def set_product
      @product = Product.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def product_params
      params.require(:product).permit(:name, :price, :quantity, :description, :category_id, :brand_id, :avatar)
    end
end
