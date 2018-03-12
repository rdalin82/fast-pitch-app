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
          csv << ["first_name","surname","points"]
          value.each do |key1,value1|
            csv << [User.find(key1).first_name, User.find(key1).surname, value1 / presenters.length  ]
          end
      end
    end
  end
end
