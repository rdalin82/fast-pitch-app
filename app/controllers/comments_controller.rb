class CommentsController < ApplicationController

  def new
    @presenter = Presenter.find(params[:id])
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
    @comment = Comment.find_by("id=?",params[:id])
  end

  def update
    comment = Comment.find_by("id=?",params[:id])
    comment.update(:content=>params[:content])
    redirect_to '/presenters'
  end
end
