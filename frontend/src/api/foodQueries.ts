import { API_BASE_PATH } from '@/api/basePath';
import { convertKeys, convertKeysToSnake } from '@/helpers/stringConverters';

export interface Food {
  caloriesPerServing: number;
  carbsPerGram: number;
  fatPerGram: number;
  name: string;
  proteinPerGram: number;
  servingUnitName?: string | null;
  singleServingGrams: number;
  createdAt: string;
  updatedAt: string;
}

// React Query keys are fundamentally about data caching and refetching.
// They serve as the unique identifiers for cached data within React Query's internal cache.
const FOODS_QUERY_KEY = ['foods'];

async function getFoods(): Promise<Food[]> {
  const response = await fetch(`${API_BASE_PATH}/foods`);
  const data = await response.json();
  return convertKeys<Food[]>(data);
}

async function createFood(
  food: Omit<Food, 'createdAt' | 'updatedAt'>,
): Promise<Food> {
  const convertedFood = convertKeysToSnake(food);
  const response = await fetch(`${API_BASE_PATH}/foods`, {
    method: 'POST',
    headers: {
      'Content-Type': 'application/json',
    },
    body: JSON.stringify(convertedFood),
  });
  return convertKeys<Food>(await response.json());
}

export { FOODS_QUERY_KEY, getFoods, createFood };
