# frozen_string_literal: true

class CreateRelationships < ActiveRecord::Migration[7.0]
  def change
    create_table :relationships do |t|
      t.integer :follower_id, class_name: 'User'
      t.integer :followed_id, class_name: 'User'

      t.timestamps
    end
  end
end
