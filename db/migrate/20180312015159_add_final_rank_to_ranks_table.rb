class AddFinalRankToRanksTable < ActiveRecord::Migration[5.0]
  def change
    add_column :ranks, :final_rank, :integer
  end
end
