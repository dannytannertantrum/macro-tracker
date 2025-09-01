import { createFileRoute } from '@tanstack/react-router';
import { useQuery } from '@tanstack/react-query';

import { FOODS_QUERY_KEY, getFoods } from '@/api/foodQueries';

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
    </div>
  );
}
