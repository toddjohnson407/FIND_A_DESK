class DesksController < ApplicationController
  before_action :set_desk, only: [:show, :edit, :update, :destroy]

  def index
    @desks = Desk.all
  end

  def show
  end

  def new
    @desk = Desk.new
  end

  def edit
  end

  def create
    @desk = Desk.new(desk_params)
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
      format.html { redirect_to desks_url, notice: 'desk was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
  def set_desk
    @desk = Desk.find(params[:id])
  end

  def desk_params
    params.require(:desk).permit(:name, :user_id, :price, :description, :address, :photo)
  end
end
