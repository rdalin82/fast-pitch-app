class Score < ApplicationRecord
  belongs_to :Questions

  def change_score
    if user.id = score.find(user_id) || user.admin
      score.update
    else
      score.create
    end
  end

  def points_total(id)
    @presenter = Presenter.find(presenter_id)
    @points_total = 0

    @presenter.points.each do |point|
      @points_total += point
    end
    @points_total
  end
end
