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
    return redirect_to products_path, notice: 'success' if @product.save
    flash.now[:notice] = 'Wrong input.'
    render :new
  end

  def edit
    @product = Product.find(params[:id])
    render :new
  end

  def update
    @product = Product.find(params[:id])
    return redirect_to products_path, notice: 'success' if @product.update(product_params)
    flash.now[:notice] = 'Wrong input.'
    render :new
  end

  def destroy
    @product = Product.find(params[:id])
    flash[:notice] = 'Delete fail.'
    flash[:notice] = 'Success' if @product.destroy
    return redirect_to products_path
  end

  private
  # securing information
  def product_params
    params.require(:product).permit(:title, :description, :price, :published, :category_id, :level)
  end
end