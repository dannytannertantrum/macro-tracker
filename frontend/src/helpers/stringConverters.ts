/**
 * Converts a snake_case string to camelCase.
 * @param str The string to convert.
 * @returns The camelCase string.
 */
export const snakeToCamel = (str: string): string =>
  str.replace(/(_\w)/g, (k) => k[1].toUpperCase());

/**
 * Recursively converts all snake_case keys in an object to camelCase.
 * @param obj The object to convert.
 * @returns The new object with camelCase keys.
 */
export const convertKeys = <T>(obj: any): T => {
  if (Array.isArray(obj)) {
    return obj.map((v) => convertKeys(v)) as T;
  }

  if (obj !== null && typeof obj === 'object') {
    return Object.keys(obj).reduce((acc, key) => {
      const newKey = snakeToCamel(key);
      acc[newKey] = convertKeys(obj[key]);
      return acc;
    }, {} as any) as T;
  }

  return obj as T;
};

/**
 * Converts a camelCase string to snake_case.
 * @param str The string to convert.
 * @returns The snake_case string.
 */
export const camelToSnake = (str: string): string =>
  str.replace(/[A-Z]/g, (letter) => `_${letter.toLowerCase()}`);

/**
 * Recursively converts all camelCase keys in an object to snake_case.
 * @param obj The object to convert.
 * @returns The new object with snake_case keys.
 */
export const convertKeysToSnake = <T>(obj: any): T => {
  if (Array.isArray(obj)) {
    return obj.map((v) => convertKeysToSnake(v)) as T;
  }

  if (obj !== null && typeof obj === 'object') {
    return Object.keys(obj).reduce((acc, key) => {
      const newKey = camelToSnake(key);
      acc[newKey] = convertKeysToSnake(obj[key]);
      return acc;
    }, {} as any) as T;
  }

  return obj as T;
};
