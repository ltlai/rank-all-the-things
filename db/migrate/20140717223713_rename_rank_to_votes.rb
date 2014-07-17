class RenameRankToVotes < ActiveRecord::Migration
  def change
    rename_column :items, :rank, :votes
  end
end
