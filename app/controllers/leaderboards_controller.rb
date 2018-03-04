class LeaderboardsController < ApplicationController
  before_action :query_options

  def show
    @lb = Boards.default_leaderboard
    @scores = entry_service.execute(query_options)
    respond_to do |format|
      format.html do
        paginate
      end
      format.json do
        render json: @scores
      end
    end
  end

  private

  def paginate
    pager = Kaminari.paginate_array(
      @scores,
      total_count: @lb.total_members)

    @page_array = pager.page(@page).per(@limit)
  end

  def entry_service
    Boards::GetAllService.new
  end
end
