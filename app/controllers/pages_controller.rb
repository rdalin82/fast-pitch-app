class PagesController < ApplicationController
  def home
    @current_user = current_user
  end

  def index
    @current_user = current_user
    @scores =Score.joins(:presenter).merge(Presenter.order(:name))
    respond_to do |format|
      format.html
      format.csv { send_data @scores.to_csv, filename: "users-#{Date.today}.csv" }
    end
  end

  def csv
    @hash = {}
    presenters = Presenter.all
    Presenter.all.each do |presenter|
      @hash[presenter.name] = Score.where("presenter_id=?",presenter.id).group('user_id').sum('points')
   end
    respond_to do |format|
      format.html
      format.csv { send_data presenters.to_csv1, filename: "Average-#{Date.today}.csv" }
    end
  end
end
