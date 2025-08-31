class CreateLogs < ActiveRecord::Migration[8.0]
  def change
    create_table :logs do |t|
      t.references :food, null: false, foreign_key: true
      t.decimal :grams_consumed
      t.decimal :number_of_servings
      t.integer :meal_type, null: false, default: 0

      t.timestamps
    end
  end
end
