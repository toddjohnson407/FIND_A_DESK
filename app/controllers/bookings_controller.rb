class BookingsController < ApplicationController
  before_action :set_desk, only: [:new, :create]
  before_action :set_booking, only: [:show, :edit, :update, :destroy]

  def current_index
    @bookings = policy_scope(Booking).order(created_at: :desc)
  end

  def index
    @bookings = policy_scope(Booking).order(created_at: :desc)
  end

  def show
    
  end

  def edit
  end

  def new
    @booking = Booking.new
  end

  def create
    @booking = Booking.new(booking_params)
    @booking.user = current_user
    @booking.desk = @desk

    if @booking.save
      redirect_to desk_booking_path(@desk, @booking), notice: 'You have booked this desk.'
    else
      render :new, notice: 'Could not book.'
    end
  end

  def update
    if @booking.update(booking_params)
      redirect_to desk_bookings_path
    else
      render :edit
    end
  end

  def destroy
    @booking.destroy
    respond_to do |format|
      format.html { redirect_to bookings_path, notice: 'booking was successfully removed.' }
      format.json { head :no_content }
    end
  end

  private

  def set_desk
    @desk = Desk.find(params[:desk_id])
  end

  def set_booking
    @booking = Booking.find(params[:id])
    authorize @booking
  end

  def booking_params
    params.require(:booking).permit(:start_date, :end_date, :desk_id, :user_id)
  end

end
