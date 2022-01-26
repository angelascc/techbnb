class BookingRequestsController < ApplicationController
  def index
    @bookings = BookingRequest.all
  end

  def show
    @booking = BookingRequest.find(params[:id])
  end

  def new
    @product = Product.find(params[:product_id])
    @booking = BookingRequest.new
  end

  def create
    @booking = BookingRequest.new(booking_params)
    @product = Product.find(params[:product_id])
    @user = current_user
    @booking.product = @product
    @booking.user = @user

    if @booking.save
      redirect_to booking_request_path(@booking)
    else
      render :new
    end
  end

  def destroy
    @booking = BookingRequest.find(params[:id])
    @booking.destroy
    redirect_to booking_requestS_path(@booking.product)
  end

  def accept
  end

  def reject
  end

  private

  def booking_params
    params.require(:booking).permit(:date)
  end
end
