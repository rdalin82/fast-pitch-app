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
    @presenter = Presenter.find_by(id: params[:id])
  end

  def create
    FinalRank.create(
      user_id: current_user.id,
      presenter_id: params[:presenter_id],
      final_rank: params[:final_rank]
    )
    respond_to do |format|
      format.html { redirect_to '/final_ranks' }
      format.json { redirect_to '/final_ranks' }
    end
  end

  def update
    final_rank = FinalRank.find_by(["presenter_id=? and user_id=?", params[:id], current_user.id])
    final_rank.update(
      user_id: current_user.id,
      presenter_id: params[:presenter_id],
      final_rank: params[:final_rank]
    )
    respond_to do |format|
      format.html { redirect_to '/final_ranks' }
      format.json { redirect_to '/final_ranks' }
    end
  end
end
