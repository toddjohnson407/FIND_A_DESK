class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: :home

  def home
    # if !params[:search].nil?
    #   @desks = Desk.where(address: params['search']['address']).order(created_at: :desc)
    #   redirect_to search_results_path

    # end
  end

  def about
  end
end
