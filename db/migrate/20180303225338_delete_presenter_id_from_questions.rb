class DeletePresenterIdFromQuestions < ActiveRecord::Migration[5.0]
  def change
    remove_column :questions, :presenter_id, :integer
    remove_column :questions, :user_id, :integer
  end
end
