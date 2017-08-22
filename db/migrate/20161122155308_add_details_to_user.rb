class AddDetailsToUser < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :name, :string, null:false
    add_column :users, :avatar, :string
    add_column :users, :birthday, :date
    add_column :users, :street_address, :string
    add_column :users, :apt_num, :string
    add_column :users, :city, :string
    add_column :users, :state, :string
    add_column :users, :zip, :integer
    add_column :users, :phone_num, :string
    add_column :users, :admin?, :boolean, default: false
  end
end
