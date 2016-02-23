class AddValuesToUsers < ActiveRecord::Migration
  def change
    add_column :users, :name, :string
    add_column :users, :role, :string
    add_column :users, :address, :string
    add_column :users, :city, :string
    add_column :users, :state, :string
  end
end
