import { API_BASE_PATH } from '@/api/basePath';

interface Food {
  name: string;
  carbsPerGram: number;
  fatPerGram: number;
  proteinPerGram: number;
  singleServingGrams: number;
  servingUnitName: string | null;
  createdAt: string;
  updatedAt: string;
}

// React Query keys are fundamentally about data caching and refetching.
// They serve as the unique identifiers for cached data within React Query's internal cache.
const FOODS_QUERY_KEY = ['foods'];

async function getFoods(): Promise<Food[]> {
  const response = await fetch(`${API_BASE_PATH}/foods`);
  return await response.json();
}

export { FOODS_QUERY_KEY, getFoods };
