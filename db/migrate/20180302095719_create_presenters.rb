class CreatePresenters < ActiveRecord::Migration[5.0]
  def change
    create_table :presenters do |t|
      t.string :name
      t.string :photo
      t.integer :points
      t.text :comment

      t.timestamps
    end
  end
end
