class RemoveRankedBooleanFromPresenters < ActiveRecord::Migration[5.0]
  def change
    remove_column :presenters, :ranked, :boolean
  end
end
