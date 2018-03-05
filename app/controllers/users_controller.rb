class UsersController < ApplicationController
  def new
  end

  def create
    user = User.new(
      first_name: params[:first_name],
      surname: params[:surname],
      username: params[:username],
      password: params[:password],
      password_confirmation: params[:password_confirmation]
    )
    if user.save
      session[:user_id] = user.id
      flash[:success] = 'Successfully created account!'
      redirect_to '/presenters'
    else
      flash[:warning] = 'Invalid email or password!'
      redirect_to '/'
    end
  end
end
