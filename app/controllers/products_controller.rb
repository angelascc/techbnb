class ProductsController < ApplicationController
  def index
    @products = Product.all
  end

  def new
    @user = User.find(params[:user_id])
    @product = Product.new
  end

  def create
    @product = Product.new(product_params)
    @user = User.find(params[:user_id])
    @product.user = @user
    if @product.save
      redirect_to user_path(@user)
    else
      render :new
    end
  end

  private

  def product_params
    params.require(:product).permit(:is_available, :city, :price)
  end
end
