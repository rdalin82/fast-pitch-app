class Presenter < ApplicationRecord
  has_many :questions, through: :question_presenter
  has_many :comments
  has_many :scores
  has_many :ranks
  has_many :finalRanks

  def self.to_csv1
    CSV.generate do |csv|
      csv << ["Presenters"]
      presenters = Presenter.all
      hash ={}
      presenters.each do |presenter|
        hash[presenter.name] = Score.where("presenter_id=?",presenter.id).group('user_id').sum('points')
      end
      hash.each do |key,value|
        csv <<  [key]
          csv << ["first_name","surname","points","final_rank"]
          value.each do |key1,value1|
            presenter_id = Presenter.find_by("name=?", key).id
            if FinalRank.find_by("user_id=? and presenter_id=?", key1, presenter_id)== nil
              final = 0
            else
              final = FinalRank.find_by("user_id=? and presenter_id=?", key1, presenter_id).final_rank
            end
            csv << [User.find(key1).first_name, User.find(key1).surname, value1 / presenters.length, final ]
          end
      end
    end
  end
end
