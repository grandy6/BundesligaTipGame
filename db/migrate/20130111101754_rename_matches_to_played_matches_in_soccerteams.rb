class RenameMatchesToPlayedMatchesInSoccerteams < ActiveRecord::Migration
  def up
  	rename_column(:soccerteams, :matches, :played_matches)
  end

  def down
  end
end
