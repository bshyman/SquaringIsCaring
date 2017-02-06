class AddPositionyToCells < ActiveRecord::Migration[5.0]
  def change
    add_column :cells, :positiony, :string
  end
end
