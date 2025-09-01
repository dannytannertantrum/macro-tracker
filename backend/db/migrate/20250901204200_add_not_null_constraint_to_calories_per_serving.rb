class AddNotNullConstraintToCaloriesPerServing < ActiveRecord::Migration[8.0]
  def change
    change_column_null :foods, :calories_per_serving, false
  end
end
