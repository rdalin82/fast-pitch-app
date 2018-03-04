class ScoresController < ApplicationController
  # before_action :authenticate_user!
  def index
    sort_attribute = params[:sort_by] || 'points'
    sort_attribute_order = params[:sort_order] || 'asc'
    @scores = Score.all.order(sort_attribute => sort_attribute_order)
    render 'index.html.erb'
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
