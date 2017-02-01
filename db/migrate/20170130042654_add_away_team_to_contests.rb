class AddAwayTeamToContests < ActiveRecord::Migration[5.0]
  def change
    add_column :contests, :away_team, :string
  end
end
