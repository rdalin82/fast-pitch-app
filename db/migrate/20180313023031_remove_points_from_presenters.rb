class RemovePointsFromPresenters < ActiveRecord::Migration[5.0]
  def change
    remove_column :presenters, :points, :integer
  end
end
