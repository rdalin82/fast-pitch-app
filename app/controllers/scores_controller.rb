class ScoresController < ApplicationController
  # before_action :authenticate_user!
  def index
    @presenters = Presenter.all
    @scores = Score.order(points: :desc)
  end

  def new
    @presenter = Presenter.find(params[:id])
    @questions = Question.all
  end

  def create
    params.permit!
    params[:questions].each do |score_params|
      Score.create(score_params)
    end
      redirect_to '/presenters'
  end

  def edit
    @score = Score.find(params[:id])
  end

  def update
    score = Score.find(params[:id])
    score.update(
      :score => params[:score]
    )
    redirect_to '/'
  end
end
