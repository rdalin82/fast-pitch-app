class ScoresController < ApplicationController
  before_action :authenticate_user!
  def index
    @hash = Score.sum_presenters_new(current_user.id)
  end

  def new
    @hash =Score.sum_presenters_new(current_user.id)
    @presenter = Presenter.find(params[:id])
    @questions = Question.all
  end

  def create

    presenter_id = params[:questions][0]['presenter_id']
    rank = Rank.find_by(["user_id=? and presenter_id=?",current_user.id,presenter_id.to_i])
    if rank
      rank.update(
        :scored => true
      )
    elsif rank.empty?
      rank.create(
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
    @hash =Score.sum_presenters_new(current_user.id)
    @presenter = Presenter.find(params[:id])
    @questions = Question.all
    @current_user = current_user
  end

  def update
    params.permit!
    params[:questions].each do |score_params|
      score = Score.find_by(['question_id=? and user_id=?',score_params['question_id'],current_user.id])
      score.update(score_params)
    end

    presenter_id = params[:questions][0]['presenter_id']
    comment = Comment.find_by(["presenter_id=? and user_id=?", presenter_id, current_user.id])
    if comment == nil
      redirect_to "/comments/new/#{presenter_id}"
    else
      redirect_to "/comments/#{comment.id}/edit"
    end
  end

  def csv
    @scores =Score.joins(:presenter).merge(Presenter.order(:name))
    respond_to do |format|
      format.html
      format.csv { send_data @scores.to_csv}
    end
  end
end
