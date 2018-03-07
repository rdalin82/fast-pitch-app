class ScoresController < ApplicationController
  before_action :authenticate_user!
  def index
    @hash = Score.sum_presenters_index
  end

  def new
    @hash =Score.sum_presenters_new(current_user.id)
    @presenter = Presenter.find(params[:id])
    @questions = Question.all
  end

  def create

    presenter_id = params[:questions][0]['presenter_id']
    if Rank.where(["user_id=? and presenter_id=?",current_user.id,presenter_id]).empty?
      Rank.create(
        :user_id => current_user.id,
        :presenter_id => presenter_id,
        :scored => true
      )
    end
    params.permit!
    params[:questions].each do |score_params|
      Score.create(score_params)
    end
      redirect_to "/comments/new/#{presenter_id}"
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
