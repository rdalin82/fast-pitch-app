class RenameRankToFinalRank < ActiveRecord::Migration[5.0]
  def change
    rename_column :final_ranks, :rank, :final_rank
  end
end
