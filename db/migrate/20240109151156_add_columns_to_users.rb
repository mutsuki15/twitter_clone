# frozen_string_literal: true

class AddColumnsToUsers < ActiveRecord::Migration[7.0]
  def change
    change_table :users, bulk: true do |t|
      t.string :name, default: '', null: false
      t.string :phone_number, default: '', null: false
      t.date :date_of_birth, default: Date.new(2000, 1, 1), null: false
    end
  end
end
