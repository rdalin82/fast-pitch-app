class DropPresenterQuestion < ActiveRecord::Migration[5.0]
  def change
    drop_table :presenter_questions
  end
end
