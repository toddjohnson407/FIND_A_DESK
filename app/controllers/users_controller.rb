class UsersController < ApplicationController

  def user_params
    params.require(:user).permit(:name, :password, :password_confirmation)
  end

end
