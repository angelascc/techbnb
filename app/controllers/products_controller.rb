class ProductsController < ApplicationController

  before_action :set_user, only: [ :new, :create]
  before_action :set_product, only: [ :show, :edit, :update, :destroy ]

  def index
    @products = Product.all
  end

  def show
  end

  def new
    @product = Product.new
  end

  def create
    @product = Product.new(product_params)
    @product.user = current_user
    if @product.save
      redirect_to product_path(@product)
    else
      render :new
    end
  end

  def edit
  end

  def update
    @product.user = current_user
    @product.update(product_params)

    redirect_to product_path(@product)
  end

  def destroy
    @product.destroy
    redirect_to product_path(@product.user)
  end

  private

  def set_user
    @user = current_user
  end

  def set_product
    @product = Product.find(params[:id])
  end

  def product_params
    params.require(:product).permit(:name, :description, :address, :is_available, :city, :price)
  end
end
