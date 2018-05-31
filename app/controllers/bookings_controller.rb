class BookingsController < ApplicationController
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

  def create
    @desk = Desk.find(params[:desk_id])
    @booking = Booking.new(desk: @desk, user: current_user)

    if @booking.save
      redirect_to desk_bookings_path
    else
      redirect_to desk_path(@desk), notice: 'could not book'
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
    # Use callbacks to share common setup or constraints between actions.

  def set_booking
    @booking = booking.find(params[:id])
    authorize @booking
  end
end
