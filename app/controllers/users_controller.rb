class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    user = User.new(user_params)
    if user.save
      session[:user_id] = user.id
      flash[:success] = "Welcome, your account was successfully created."
      redirect_to :root
    else
      error_type = user.errors.full_messages.to_sentence
      flash[:failure] = "#{error_type}. Your account failed to be created"
      redirect_to :signup
    end
  end

  def user_params
    params.require(:user).permit(:email, :password, :password_confirmation)
  end
end
