class ScoresController < ApplicationController
  before_action :authenticate_user!
  def index
    @hash ={}
    scores = Score.group('presenter_id').sum(:points)
    scores.each do |key,value|
       x = Score.find_by(presenter_id: key)
      @hash[x.presenter.name]=value
    end
    @hash
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

  def csv
    @scores =Score.joins(:presenter).merge(Presenter.order(:name))
    respond_to do |format|
      format.html
      format.csv { send_data @scores.to_csv}
    end
  end
end
