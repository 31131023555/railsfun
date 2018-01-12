class ProductsController < ApplicationController
  def index
    @products = Product.includes(:category).active
  end

  def show
    @product = Product.find(params[:id])
  end

  def new
    @product = Product.new
  end

  def create
    @product = Product.new(product_params)
    return redirect_to products_path, notice: 'ss' if @product.save
      flash.now[:notice] = 'Wrong input.'
      render :new
  end

  private
  # securing information
  def product_params
    params.require(:product).permit(:title, :description, :price, :published, :category_id)
  end
end