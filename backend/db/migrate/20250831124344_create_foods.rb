class CreateFoods < ActiveRecord::Migration[8.0]
  def change
    create_table :foods do |t|
      t.string :name, null: false
      t.decimal :carbs_per_gram, null: false
      t.decimal :fat_per_gram, null: false
      t.decimal :protein_per_gram, null: false
      t.decimal :single_serving_grams, null: false
      t.string :serving_unit_name

      t.timestamps
    end
  end
end
