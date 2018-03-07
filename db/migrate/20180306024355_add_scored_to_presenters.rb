class AddScoredToPresenters < ActiveRecord::Migration[5.0]
  def change
    add_column :presenters, :scored, :boolean
  end
end
