class ProductsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show]

  before_action :set_user, only: [ :new, :create, :show]
  before_action :set_product, only: [ :show, :edit, :update, :destroy ]

  def index
    @products = Product.all
  end

  def search
    @products = Product.near(params[:query], 10)

    @markers = @products.map do |product|
      {
        lat: product.latitude,
        lng: product.longitude
      }
    end
  end

  def show
    @markers = { lat: @product.latitude, lng: @product.longitude }

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
    redirect_to products_path
  end

  private

  def set_user
    @user = current_user
  end

  def set_product
    @product = Product.find(params[:id])
  end

  def product_params
    params.require(:product).permit(:name, :description, :address, :is_available, :city, :price, :photo)
  end
end
