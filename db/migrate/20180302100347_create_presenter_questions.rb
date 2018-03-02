class CreatePresenterQuestions < ActiveRecord::Migration[5.0]
  def change
    create_table :presenter_questions do |t|
      t.integer :presenter_id
      t.integer :question_id

      t.timestamps
    end
  end
end
