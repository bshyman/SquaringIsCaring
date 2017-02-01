class AddEventDateToContests < ActiveRecord::Migration[5.0]
  def change
    add_column :contests, :event_date, :datetime
  end
end
