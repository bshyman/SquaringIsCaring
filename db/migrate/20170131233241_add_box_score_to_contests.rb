class AddBoxScoreToContests < ActiveRecord::Migration[5.0]
  def change
    add_column :contests, :box_score, :string
  end
end
