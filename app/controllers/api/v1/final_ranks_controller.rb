class Api::V1::FinalRanksController < ApplicationController
  def index
    @presenters = Presenter.all
    @current_user = current_user
    render "index.json.jbuilder"
  end

  def new
    @final_rank = FinalRank.new
    @presenter = Presenter.find_by(id: params[:id])
    render "new.json.jbuilder"
  end

  def create
    presenter_id = params[:final_ranks][0]['presenter_id']
    if FinalRank.where(["user_id=? and presenter_id=?",current_user.id,presenter_id]).empty?
      FinalRank.create(
        :user_id => current_user.id,
        :presenter_id => presenter_id,
        final_rank: params[:final_rank],
      )
    elsif FinalRank.where(["user_id=? and presenter_id=?",current_user.id,presenter_id]).update(
      final_rank: params[:final_rank],
      )
    end
    params.permit!
    if final_rank.save
      render "index.json.jbuilder"
    else
      render json: { errors: @person.errors.full_messages }, status: 422
    end
  end
end
