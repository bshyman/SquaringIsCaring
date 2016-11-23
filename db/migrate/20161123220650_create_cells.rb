class CreateCells < ActiveRecord::Migration[5.0]
  def change
    create_table :cells do |t|
      t.integer :contest_id, null:false
      t.integer :user_id, null:false
      t.string :position, null:false, array: true, default: []
      t.string :result, null:false, array: true, default: []

      t.timestamps(null: false)
    end
  end
end
