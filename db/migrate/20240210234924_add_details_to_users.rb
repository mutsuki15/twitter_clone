# frozen_string_literal: true

class AddDetailsToUsers < ActiveRecord::Migration[7.0]
  def change
    change_table :users, bulk: true do |t|
      t.string :custom_user_id, default: '', null: false
      t.string :profile, default: '', null: false
      t.string :location, default: '', null: false
      t.string :web_site, default: '', null: false
    end
  end
end
