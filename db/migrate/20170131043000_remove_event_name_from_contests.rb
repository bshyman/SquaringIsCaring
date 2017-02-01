class RemoveEventNameFromContests < ActiveRecord::Migration[5.0]
  def change
    remove_column :contests, :event_name, :string
  end
end
