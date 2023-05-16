# frozen_string_literal: true

class CreateBoard < ActiveRecord::Migration[7.0]
  def change
    create_table :boards do |t|
      t.string :email, null: false
      t.string :name
      t.boolean :matrix, array: true, null: false

      t.timestamps
    end
  end
end
