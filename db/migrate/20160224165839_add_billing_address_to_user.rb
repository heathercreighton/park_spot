class AddBillingAddressToUser < ActiveRecord::Migration
  def change
    add_column :users, :bill_add, :string
  end
end
