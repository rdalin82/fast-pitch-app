class AddPresentersIdtoQuestions < ActiveRecord::Migration[5.0]
  def change
    add_column :questions, :presenter_id, :integer
    add_column :questions, :user_id, :integer
    remove_column :questions, :advantage, :integer
    remove_column :questions, :engaged, :integer
    remove_column :questions, :impact, :integer
    remove_column :questions, :ask, :integer
    remove_column :questions, :style, :integer
    remove_column :questions, :inspiration, :integer
    add_column :scores, :question_id, :integer
  end
end
