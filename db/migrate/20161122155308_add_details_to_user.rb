class AddDetailsToUser < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :first_name, :string, null:false
    add_column :users, :last_name, :string, null:false
    add_column :users, :avatar, :string
    add_column :users, :birthday, :date, null:false
    add_column :users, :street_address, :string, null:false
    add_column :users, :apt_num, :string
    add_column :users, :city, :string, null:false
    add_column :users, :state, :string, null:false
    add_column :users, :zip, :integer, null:false
    add_column :users, :phone_num, :string, null:false
    add_column :users, :admin?, :boolean, default: false

  end
end
