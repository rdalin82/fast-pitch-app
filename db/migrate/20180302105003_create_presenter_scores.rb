class CreatePresenterScores < ActiveRecord::Migration[5.0]
  def change
    create_table :presenter_scores do |t|
      t.integer :presenter_id
      t.integer :score_id

      t.timestamps
    end
  end
end
