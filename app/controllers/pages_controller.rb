class PagesController < ApplicationController
  def home
    @current_user = current_user
  end

  def csv_form_responses
    @current_user = current_user
    @users = User.all
    @count = 0
    @questions = Question.all
    @presenters = Presenter.all
    @points = Score.sum_presenters_new(current_user.id)
    @scores =Score.joins(:presenter).merge(Presenter.order(:name))
    respond_to do |format|
      format.html
      format.csv { send_data @scores.to_csv, filename: "users-#{Date.today}.csv" }
    end
  end

  def csv_avg_scores
  end

  def csv_avg_ranks
    @current_user = current_user
    @hash = {}
    @presenters = Presenter.all
    @users = User.all
    @final_ranks = FinalRank.all
    @avg_ranks = FinalRank.group('presenter_id').sum(:final_rank)
    puts @avg_ranks
    @questions = Question.all
    presenters = Presenter.all
    Presenter.all.each do |presenter|
      @hash[presenter.name] = Score.where("presenter_id=?",presenter.id).group('user_id').sum('points').all?
    end
    respond_to do |format|
      format.html
      format.csv { send_data presenters.to_csv1, filename: "Average-#{Date.today}.csv" }
    end
  end
end
