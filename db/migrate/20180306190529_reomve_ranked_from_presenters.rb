class ReomveRankedFromPresenters < ActiveRecord::Migration[5.0]
  def change
    remove_column :presenters, :scored, :boolean
  end
end
