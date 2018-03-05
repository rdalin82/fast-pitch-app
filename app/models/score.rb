class Score < ApplicationRecord
  belongs_to :question, required: false
  belongs_to :user, required: false
  belongs_to :presenter, required: false

  def change_score
    if user.id = score.find(user_id) || user.admin
      score.update
    else
      score.create
    end
  end

  def points_total(_id)
    @presenter = Presenter.find(presenter_id)
    @points_total = 0

    @presenter.points.each do |point|
      @points_total += point
    end
    @points_total
  end

  def self.to_csv
    CSV.generate do |csv|
      csv << ["presenter_name","user_name", "question", "points_for_question"]
      scores = Score.joins(:presenter,:user,:question)
      scores.each do |score|
        csv <<  [score.presenter.name, score.user.name, score.question.content, score.points]
      end
    end
  end

end
