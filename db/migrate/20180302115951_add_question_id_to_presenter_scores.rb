class AddQuestionIdToPresenterScores < ActiveRecord::Migration[5.0]
  def change
    add_column :presenter_scores, :question_id, :integer
  end
end
