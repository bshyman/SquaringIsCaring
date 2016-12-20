class CreateContests < ActiveRecord::Migration[5.0]
  def change
    create_table :contests do |t|
      t.string :event_name, null:false
      t.date :event_date, null: false
      t.integer :cell_value, null:false
      t.string :home_axis, null:false, array: true, default: [0,1,2,3,4,5,6,7,8,9].shuffle
      t.string :away_axis, null:false, array: true, default: [0,1,2,3,4,5,6,7,8,9].shuffle
      t.string :reserve, default: "50"
      t.string :sport, null:false
      t.string :prizes, array: true, default: []
      t.string :available_nums, array: true, default: []

      t.timestamps(null: false)
    end
  end
end
