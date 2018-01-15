class ProductsController < ApplicationController
  before_action :get_product_by_id, only: [:show, :edit, :update, :destroy]
  def index
    @products = Product.includes(:category).active
  end

  def show
  end

  def new
    @product = Product.new
  end

  def create
    @product = Product.new(product_params)
    return redirect_to products_path, notice: 'success' if @product.save
    flash.now[:notice] = 'Wrong input.'
    render :new
  end

  def edit
    render :new
  end

  def update
    return redirect_to products_path, notice: 'success' if @product.update(product_params)
    flash.now[:notice] = 'Wrong input.'
    render :new
  end

  def destroy
    flash[:notice] = 'Delete fail.'
    flash[:notice] = 'Success' if @product.destroy
    return redirect_to products_path
  end

  private
  # securing information

  def get_product_by_id
    @product = Product.find(params[:id])
  end

  def product_params
    params.require(:product).permit(:title, :description, :price, :published, :category_id, :level)
  end
end