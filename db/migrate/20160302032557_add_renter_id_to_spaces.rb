class AddRenterIdToSpaces < ActiveRecord::Migration
  def change
    add_column :spaces, :renter_id, :integer
  end
end
