class ScoresController < ApplicationController
  # before_action :authenticate_user!

  def new
    @presenter = Presenter.find(params[:id])
    @questions=Question.all
  end

  def create
    params.permit!
    params[:questions].each do |score_params|
      Score.create(score_params)
    end
    redirect_to '/presenters'
  end
end
