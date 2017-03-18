class AddPositionxToCells < ActiveRecord::Migration[5.0]
  def change
    add_column :cells, :positionx, :string
  end
end
