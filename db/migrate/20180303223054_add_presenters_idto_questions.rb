class AddPresentersIdtoQuestions < ActiveRecord::Migration[5.0]
  def change
    add_column :questions, :presenter_id, :integer
    add_column :questions, :user_id, :integer
    add_column :scores, :question_id, :integer
  end
end
