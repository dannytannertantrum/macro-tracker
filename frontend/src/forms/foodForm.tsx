import { Button, Grid, TextField } from '@mui/material';
import { useForm } from '@tanstack/react-form';
import type { UseMutationResult } from '@tanstack/react-query';

import type { Food } from '@/api/foodQueries';

const defaultFood = {
  name: '',
  carbsPerGram: '0',
  fatPerGram: '0',
  proteinPerGram: '0',
  singleServingGrams: '0',
  servingUnitName: 'serving',
};

function validateStringsToNumbers(value: string) {
  if (
    value === '' ||
    typeof Number(value) !== 'number' ||
    isNaN(Number(value)) ||
    Number(value) < 0
  ) {
    return 'Must be a valid number';
  }
}

export default function FoodForm({
  createFoodMutation,
}: {
  createFoodMutation: UseMutationResult<
    Food,
    Error,
    Omit<Food, 'createdAt' | 'updatedAt'>,
    unknown
  >;
}) {
  const { Field, handleSubmit } = useForm({
    // defaultValues is the same as if we used formOptions
    defaultValues: defaultFood,
    onSubmit: ({ value }) => {
      // Don't forget to convert strings to numbers because MUI does not recommend type="number"
      const parsedValue = {
        ...value,
        carbsPerGram: Number(value.carbsPerGram),
        fatPerGram: Number(value.fatPerGram),
        proteinPerGram: Number(value.proteinPerGram),
        singleServingGrams: Number(value.singleServingGrams),
      };

      console.log(parsedValue);
      createFoodMutation.mutate(parsedValue);
    },
  });

  return (
    <form
      onSubmit={(e) => {
        e.preventDefault();
        handleSubmit();
      }}
    >
      <Grid container spacing={2} mb={2}>
        <Field
          name="name"
          validators={{
            onChange: ({ value }) => (!value ? 'Name is required' : undefined),
          }}
        >
          {(field) => (
            <TextField
              color={field.state.meta.isValid ? 'primary' : 'error'}
              error={!field.state.meta.isValid}
              helperText={
                !field.state.meta.isValid && field.state.meta.errors.join(', ')
              }
              label="Name"
              value={field.state.value}
              variant="filled"
              onBlur={field.handleBlur}
              onChange={(e) => field.handleChange(e.target.value)}
            />
          )}
        </Field>
        <Field
          name="carbsPerGram"
          validators={{
            onChange: ({ value }) => validateStringsToNumbers(value),
          }}
        >
          {(field) => (
            <TextField
              color={field.state.meta.isValid ? 'primary' : 'error'}
              error={!field.state.meta.isValid}
              helperText={
                !field.state.meta.isValid && field.state.meta.errors.join(', ')
              }
              label="Carbs per gram"
              value={String(field.state.value)}
              variant="filled"
              onBlur={field.handleBlur}
              onChange={(e) => field.handleChange(e.target.value)}
            />
          )}
        </Field>
        <Field
          name="fatPerGram"
          validators={{
            onChange: ({ value }) => validateStringsToNumbers(value),
          }}
        >
          {(field) => (
            <TextField
              color={field.state.meta.isValid ? 'primary' : 'error'}
              error={!field.state.meta.isValid}
              helperText={
                !field.state.meta.isValid && field.state.meta.errors.join(', ')
              }
              label="Fat per gram"
              value={String(field.state.value)}
              variant="filled"
              onBlur={field.handleBlur}
              onChange={(e) => field.handleChange(e.target.value)}
            />
          )}
        </Field>
        <Field
          name="proteinPerGram"
          validators={{
            onChange: ({ value }) => validateStringsToNumbers(value),
          }}
        >
          {(field) => (
            <TextField
              color={field.state.meta.isValid ? 'primary' : 'error'}
              error={!field.state.meta.isValid}
              helperText={
                !field.state.meta.isValid && field.state.meta.errors.join(', ')
              }
              label="Protein per gram"
              value={String(field.state.value)}
              variant="filled"
              onBlur={field.handleBlur}
              onChange={(e) => field.handleChange(e.target.value)}
            />
          )}
        </Field>
        <Field
          name="singleServingGrams"
          validators={{
            onChange: ({ value }) => validateStringsToNumbers(value),
          }}
        >
          {(field) => (
            <TextField
              color={field.state.meta.isValid ? 'primary' : 'error'}
              error={!field.state.meta.isValid}
              helperText={
                !field.state.meta.isValid && field.state.meta.errors.join(', ')
              }
              label="Single serving grams"
              value={String(field.state.value)}
              variant="filled"
              onBlur={field.handleBlur}
              onChange={(e) => field.handleChange(e.target.value)}
            />
          )}
        </Field>
        <Field name="servingUnitName">
          {(field) => (
            <TextField
              color={field.state.meta.isValid ? 'primary' : 'error'}
              error={!field.state.meta.isValid}
              helperText={
                !field.state.meta.isValid && field.state.meta.errors.join(', ')
              }
              label="Serving unit name"
              value={field.state.value}
              variant="filled"
              onBlur={field.handleBlur}
              onChange={(e) => field.handleChange(e.target.value)}
            />
          )}
        </Field>
      </Grid>
      <Button type="submit" variant="contained">
        Add Food
      </Button>
    </form>
  );
}
