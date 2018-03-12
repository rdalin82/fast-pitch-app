class PagesController < ApplicationController
  def home
    @current_user = current_user
  end

  def index
    @current_user = current_user
    @scores =Score.joins(:presenter).merge(Presenter.order(:name))
    puts '+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++'
    @hash = {}
    Presenter.all.each do |presenter|
      @hash[presenter.name] = Score.where("presenter_id=?",presenter.id).group('user_id').sum('points')
   end
   # hash.each do |key1,value1|
   #   value1.to_a.each do |key,value|
   #     x = Score.find_by(user_id: key)
   #     y = Presenter.find_by(name: key1)
   #     hash[y.name][x.user.surname] = value
   #   end
   # end
   # puts hash
    puts '+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++'

    respond_to do |format|
      format.html
      format.csv { send_data @scores.to_csv, filename: "users-#{Date.today}.csv" }
    end
  end
end
