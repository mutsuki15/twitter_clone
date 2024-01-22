class AddColumnsToUsers < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :name, :string, null: false
    add_column :users, :phone_number, :string, null: false
    add_column :users, :date_of_birth, :date, null: false
  end
end
