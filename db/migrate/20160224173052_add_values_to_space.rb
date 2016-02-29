class AddValuesToSpace < ActiveRecord::Migration
  def change
    add_column :spaces, :address, :string
    add_column :spaces, :open, :boolean
    add_column :spaces, :start, :date
    add_column :spaces, :end, :date
  end
end
