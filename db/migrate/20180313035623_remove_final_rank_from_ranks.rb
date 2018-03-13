class RemoveFinalRankFromRanks < ActiveRecord::Migration[5.0]
  def change
    remove_column :ranks, :final_rank, :integer
  end
end
