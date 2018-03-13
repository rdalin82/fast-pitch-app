class Score < ApplicationRecord
  belongs_to :question, required: false
  belongs_to :user, required: false
  belongs_to :presenter, required: false

  def self.to_csv
    CSV.generate do |csv|
      csv << ["presenter_name","first_name","surname", "question", "points_for_question"]
      scores = Score.joins(:presenter,:user,:question)
      scores.each do |score|
        csv <<  [score.presenter.name, score.user.first_name, score.user.surname, score.question.content, score.points]
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

  def self.average_for_question_points
    hash ={}
    Presenter.all.each do |presenter|
     puts Score.where("presenter_id=?",presenter.id).group('user_id').sum('points')

   end
    scores = Score.group('presenter_id').sum(:points)
    scores.each do |key,value|
       x = Score.find_by(presenter_id: key)
      hash[x.presenter.name]=value
    end
    hash
  end

end
