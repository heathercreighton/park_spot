class CreateSpaces < ActiveRecord::Migration
  def change
    create_table :spaces do |t|
      t.integer :user_id
      t.decimal :price

      t.timestamps null: false
    end
  end
end
