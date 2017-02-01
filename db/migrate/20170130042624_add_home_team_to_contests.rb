class AddHomeTeamToContests < ActiveRecord::Migration[5.0]
  def change
    add_column :contests, :home_team, :string
  end
end
