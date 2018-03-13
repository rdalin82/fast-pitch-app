class RemoveRankedBooleanFromUsers < ActiveRecord::Migration[5.0]
  def change
    remove_column :users, :ranked, :boolean
  end
end
