class Presenter < ApplicationRecord
  has_many :questions, through: :question_presenter
  has_many :comments
  has_many :scores
  has_many :ranks
  has_many :finalRanks

  def self.to_csv1
    CSV.generate do |csv|
      array = []
      array << "Coach Name"
      Presenter.all.each do |presenter|
        array << presenter.name
      end
      csv << array

      User.all.each do |user|
        data_array = []
        data_array << user.first_name
          Presenter.all.each do |presenter|
            if presenter.finalRanks.find_by(["user_id=? and presenter_id=?",user.id,presenter.id])=== nil
              final = 0
            else
              final = presenter.finalRanks.find_by(["user_id=? and presenter_id=?",user.id,presenter.id]).final_rank
            end
            data_array << final
          end
          csv << data_array
      end



      other_array =["Average Score"]
      Presenter.all.each do |presenter|
        if presenter.finalRanks.find_by("presenter_id=?",presenter.id) != nil
          presenter.finalRanks.group("presenter_id").sum(:final_rank).each do |key,value|
          avg_final = (value.to_f / User.all.length.to_f).to_f
          other_array << avg_final
        end

        else
        avg_final = 0
        other_array << avg_final
        end
      end
      csv << other_array

    end
  end
end
