# README

This README primarily serves as a way to display the steps taken to create the Rails application and logic

## Steps

### Create the Scaffolds

```bash
rails generate scaffold Food name:string carbs_per_gram:decimal fat_per_gram:decimal protein_per_gram:decimal single_serving_grams:decimal serving_unit_name:string
rails generate scaffold Log food:references grams_consumed:decimal number_of_servings:decimal
rails generate scaffold Meal name:string
rails generate scaffold MealItem meal:references food:references grams_consumed:decimal number_of_servings:decimal
```

- Oops! Forgot `meal_type` in the log. Updated the model, controllers and validation before running the migration.
- Double oops! Much later, realized I didn't add calories. As a refresher for myself, here's a migration command:

```bash
rails generate migration AddCaloriesPerServingToFoods calories_per_serving:decimal
```

### Run the Migration and Create the Test DB

Probably should have changed the order of these steps, but Rails is smart enough to only create the test db

```bash
bin/rails db:migrate
bin/raise db:create
```

### Run Tests

```bash
rails test:all
```
