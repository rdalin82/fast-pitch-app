class PagesController < ApplicationController
  def home
  end

  def index
    @scores =Score.joins(:presenter).merge(Presenter.order(:name))
    respond_to do |format|
      format.html
      format.csv { send_data @scores.to_csv, filename: "users-#{Date.today}.csv" }
    end
  end
end
