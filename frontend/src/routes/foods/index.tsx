import { createFileRoute } from '@tanstack/react-router';
import { useMutation, useQuery } from '@tanstack/react-query';

import { FOODS_QUERY_KEY, createFood, getFoods } from '@/api/foodQueries';
import FoodForm from '@/forms/foodForm';
import { queryClient } from '@/main';

export const Route = createFileRoute('/foods/')({
  component: RouteComponent,
});

function RouteComponent() {
  const {
    data: foods,
    isFetching,
    isError,
  } = useQuery({
    queryKey: FOODS_QUERY_KEY,
    queryFn: getFoods,
    initialData: [],
  });

  const createFoodMutation = useMutation({
    mutationFn: createFood,
    onSuccess: () => {
      // Invalidate and refetch
      queryClient.invalidateQueries({ queryKey: ['foods'] });
    },
  });

  if (isFetching) {
    return <div>Loading...</div>;
  }

  if (isError) {
    return <div>Error loading foods</div>;
  }

  return (
    <div>
      <h1>Foods</h1>
      <ul>
        {foods.map((food) => (
          <li key={food.name}>{food.name}</li>
        ))}
      </ul>
      <FoodForm createFoodMutation={createFoodMutation} />
    </div>
  );
}
