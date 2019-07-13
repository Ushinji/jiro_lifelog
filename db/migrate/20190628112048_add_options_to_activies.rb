# frozen_string_literal: true

class AddOptionsToActivies < ActiveRecord::Migration[5.2]
  def up
    change_column_null :activities, :image_url, false, ""
    change_column :activities, :image_url, :string, default: ""

    change_column_null :activities, :calorie, false, 0
    change_column :activities, :calorie, :integer, default: 0
  end

  def down
    change_column_null :activities, :image_url, true, nil
    change_column :activities, :image_url, :string, default: nil

    change_column_null :activities, :calorie, true, nil
    change_column :activities, :calorie, :integer, default: nil
  end
end
