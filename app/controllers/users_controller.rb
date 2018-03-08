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
      presenters = Presenter.all
      presenters.each do |presenter|
        Rank.create(
          :scored => false,
          :user_id=>user.id,
          :presenter_id => presenter.id
      )
    end 
      session[:user_id] = user.id
      flash[:success] = 'Successfully created account!'
      redirect_to '/presenters'
    else
      flash[:warning] = 'Invalid email or password!'
      redirect_to '/'
    end
  end
end
