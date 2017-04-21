class UsersController < ApplicationController

  def show
    @user = User.find_by(id: params[:id])
    render :show
  end

  def create
    @user = User.new(user_params)
    if @user.save
      msg = UserMailer.activation_email(@user)
      msg.deliver_now
      redirect_to user_url(@user)
    else
      flash[:errors] = @user.errors.full_messages
      redirect_to new_user_url
    end
  end

  def new
    render :new
  end

  def activate
    @user = User.find_by(activation_token: params[:activation_token])
    if @user
      @user.activated = true
      @user.save
      login(@user)
      redirect_to user_url(@user)
    else
      flash[:errors] = ["Account not activated--invalid activation token"]
      redirect_to new_session_url
    end
  end

  private
  def user_params
    params.require(:user).permit(:email, :password)
  end
end
