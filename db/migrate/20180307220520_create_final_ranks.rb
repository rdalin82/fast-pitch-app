class CreateFinalRanks < ActiveRecord::Migration[5.0]
  def change
    create_table :final_ranks do |t|
      t.integer :user_id
      t.integer :presenter_id
      t.integer :rank

      t.timestamps
    end
  end
end
