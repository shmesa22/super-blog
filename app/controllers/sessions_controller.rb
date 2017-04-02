class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by(email: params[:email])
    if user && user.authenticate(params[:password])
      sign_in(user)
      redirect_to root_path
    else
      redirect_to login_path, alert: "Tu email y/o contraseña son invalidas. Intenta nuevamente"
    end
  end

  def destroy
    sign_out
    redirect_to root_path
  end
end
