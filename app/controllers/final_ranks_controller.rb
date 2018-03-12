class FinalRanksController < ApplicationController
  before_action :authenticate_user!
  def index
    sort_attribute = params[:sort_by] || 'name'
    sort_attribute_order = params[:sort_order] || 'asc'
    @points = Score.sum_presenters_new(current_user.id)
    @presenters = Presenter.all.order(sort_attribute => sort_attribute_order)
    @current_user = current_user
    render 'index.html.erb'
  end

  def new
    @final_rank = FinalRank.new
    @presenter = Presenter.find_by(id: params[:id])
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
      final_rank: params[:final_rank]
      )
    end
    params.permit!
    respond_to do |format|
        format.html { redirect_to "/final_ranks" }
        format.js
      end


  end
end
