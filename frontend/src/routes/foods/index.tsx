import { createFileRoute } from '@tanstack/react-router';
import { useMutation, useQuery } from '@tanstack/react-query';
import {
  Paper,
  Table,
  TableBody,
  TableCell,
  TableContainer,
  TableHead,
  TableRow,
} from '@mui/material';

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
      <TableContainer component={Paper} sx={{ marginBottom: 2 }}>
        <Table sx={{ minWidth: 650 }} aria-label="simple table">
          <TableHead>
            <TableRow>
              <TableCell>Food</TableCell>
              <TableCell align="right">Calories</TableCell>
              <TableCell align="right">Fat&nbsp;(g)</TableCell>
              <TableCell align="right">Carbs&nbsp;(g)</TableCell>
              <TableCell align="right">Protein&nbsp;(g)</TableCell>
              <TableCell align="right">Calories Per Serving</TableCell>
              <TableCell align="right">Serving Size</TableCell>
            </TableRow>
          </TableHead>
          <TableBody>
            {foods.map((food) => (
              <TableRow
                key={food.name}
                sx={{ '&:last-child td, &:last-child th': { border: 0 } }}
              >
                <TableCell component="th" scope="row">
                  {food.name}
                </TableCell>
                <TableCell align="right">{food.caloriesPerServing}</TableCell>
                <TableCell align="right">{food.fatPerGram}</TableCell>
                <TableCell align="right">{food.carbsPerGram}</TableCell>
                <TableCell align="right">{food.proteinPerGram}</TableCell>
                <TableCell align="right">{food.singleServingGrams}</TableCell>
                <TableCell align="right">1 {food.servingUnitName}</TableCell>
              </TableRow>
            ))}
          </TableBody>
        </Table>
      </TableContainer>
      <FoodForm createFoodMutation={createFoodMutation} />
    </div>
  );
}
