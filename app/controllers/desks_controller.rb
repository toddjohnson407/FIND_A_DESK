class DesksController < ApplicationController
  before_action :set_desk, only: [:show, :edit, :update, :destroy]

  def current_index
    @desks = policy_scope(Desk).order(created_at: :desc)
  end

  def index

    @desks = policy_scope(Desk).order(created_at: :desc)
    @desks = Desk.where.not(latitude: nil, longitude: nil)
    address = params[:submit][:address]

    @desks = @desks.to_a.select { |desk| desk.address == address  }

    @markers = @desks.map do |desk|
      {
        lat: desk.latitude,
        lng: desk.longitude
      }
    end
  end

  def search_results
    @desks = Desk.where(params['submit']['address']).order(created_at: :desc)
  end

  def show
      @booking = Booking.new

      @desk = Desk.find(params[:id])
      @markers = { lat: @desk.latitude, lng: @desk.longitude }
  end

  def new
    @desk = Desk.new
  end

  def edit
  end

  def create
    @rate = Rate.find_by(pricing: params[:desk][:rate])
    @desk = Desk.new(desk_params)
    @desk.rate = @rate
    @desk.user = current_user

    if @desk.save
      redirect_to desk_path(@desk)
    else
      render :new
    end
  end

  def update
    if @desk.update(desk_params)
      redirect_to desk_path(@desk)
    else
      render :edit
    end
  end

  def destroy
    @desk.destroy
    respond_to do |format|
      format.html { redirect_to current_index_path, notice: 'Desk was successfully removed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.

  def set_desk
    @desk = Desk.find(params[:id])
    authorize @desk
  end

  def desk_params
    params.require(:desk).permit(:name, :user_id, :price, :description, :address, :photo)
  end
end
