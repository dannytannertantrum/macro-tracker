class SetDefaultCaloriesPerServing < ActiveRecord::Migration[8.0]
  def up
    Food.where(calories_per_serving: nil).update_all(calories_per_serving: 0)
  end
end
