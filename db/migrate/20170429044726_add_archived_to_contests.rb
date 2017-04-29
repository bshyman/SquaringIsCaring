class AddArchivedToContests < ActiveRecord::Migration[5.0]
  def change
    add_column :contests, :archived, :boolean
  end
end
