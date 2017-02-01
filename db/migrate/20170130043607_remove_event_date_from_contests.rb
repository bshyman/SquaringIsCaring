class RemoveEventDateFromContests < ActiveRecord::Migration[5.0]
  def change
    remove_column :contests, :event_date, :string
  end
end
