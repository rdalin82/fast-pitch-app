class CreateQuestionPresenters < ActiveRecord::Migration[5.0]
  def change
    create_table :question_presenters do |t|
      t.integer :question_id
      t.integer :presenter_id

      t.timestamps
    end
  end
end
