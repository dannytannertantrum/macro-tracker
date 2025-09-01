class AddCaloriesPerServingToFoods < ActiveRecord::Migration[8.0]
  def change
    add_column :foods, :calories_per_serving, :decimal
  end
end
