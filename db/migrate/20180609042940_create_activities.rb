# frozen_string_literal: true

class CreateActivities < ActiveRecord::Migration[5.2]
  def change
    create_table :activities do |t|
      t.references :user, null: false
      t.bigint :store_id, null: false
      t.bigint :menu_id, null: false
      t.string :size, null: false
      t.string :yasai, null: false
      t.string :ninniku, null: false
      t.string :abura, null: false
      t.string :karame, null: false
      t.string :image_url
      t.integer :calorie

      t.timestamps
    end
  end
end
