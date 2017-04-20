class SessionsController < ApplicationController
  def create
    user = User.find_by_credentials(session_params)

    if user
      login(user)
      redirect_to user_url(user)
    else
      flash[:errors] = ["Invalid username or password."]
      redirect_to new_session_url
    end
  end

  def new
    render :new
  end

  def destroy
    logout
    redirect_to new_session_url
  end

  private
  def session_params
    params.require(:session).permit(:email, :password)
  end
end
