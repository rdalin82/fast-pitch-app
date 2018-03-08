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
        csv <<  [score.presenter.name, score.user.first_name,score.user.surname, score.question.content, score.points]
      end
    end
  end

  def self.sum_presenters_index
    hash ={}
    scores = Score.group('presenter_id').sum(:points)
    scores.each do |key,value|
       x = Score.find_by(presenter_id: key)
      hash[x.presenter.name]=value
    end
    hash
  end

  def self.sum_presenters_new(current_user_id)
    hash ={}
    scores = Score.where("user_id =?", current_user_id).group('presenter_id').sum(:points)
    scores.each do |key,value|
       x = Score.find_by(presenter_id: key)
      hash[x.presenter.name]=value
    end
    hash
  end

end
