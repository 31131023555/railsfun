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
    return redirect_to products_path if @product.save
    render :new
  end

  private
  def product_params
    params.require(:product).permit(:title, :description, :price, :published, :category_id)
  end
end