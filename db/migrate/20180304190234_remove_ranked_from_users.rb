class RemoveRankedFromUsers < ActiveRecord::Migration[5.0]
  def change
    remove_column :users, :ranked, :boolean, default: false
  end
end
