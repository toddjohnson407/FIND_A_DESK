class DesksController < ApplicationController
  before_action :set_desk, only: [:show, :edit, :update, :destroy]

  def current_index
    @desks = policy_scope(Desk).order(created_at: :desc)
  end

  def index
    @desks = policy_scope(Desk).order(created_at: :desc)
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
      format.html { redirect_to desks_path, notice: 'Desk was successfully removed.' }
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
