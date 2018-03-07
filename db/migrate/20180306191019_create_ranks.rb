class CreateRanks < ActiveRecord::Migration[5.0]
  def change
    create_table :ranks do |t|
      t.integer :user_id
      t.integer :presenter_id
      t.boolean :scored
      
      t.timestamps
    end
  end
end
