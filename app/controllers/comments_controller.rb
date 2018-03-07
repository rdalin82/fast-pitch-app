class CommentsController < ApplicationController

  def new
  end

  def create
    Comment.create(
      content: params[:content],
      user_id: current_user.id,
      presenter_id: params[:presenter_id]
    )
    redirect_to '/presenters'
  end

  def edit
  end

  def update
  end 
end
