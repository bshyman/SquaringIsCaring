class ChangeDateFormatInMyTable < ActiveRecord::Migration[5.0]
  def change
    change_column :contests, :event_date, :datetime  
  end
end
