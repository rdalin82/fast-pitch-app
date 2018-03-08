class QuestionsController < ApplicationController
  before_action :authenticate_admin!
  def index
    @questions = Question.all
  end

  def new
    @questions = Question.all
  end

  def create
    question = Question.new(
      :content => params[:content]
    )
    if question.save
      redirect_to '/'
    else
      redirect_to '/questions/new'
    end
  end

  def show
    @question = Question.find(params[:id])
    render 'show.html.erb'
  end

  def edit
    @question = Question.find(params[:id])
  end

  def update
    question = Question.find(params[:id])
    question.update(
      :content => params[:content]
    )
    redirect_to '/'
  end

  def destroy
    question = Question.find(params[:id])
    question.destroy
    redirect_to '/'
  end
end
