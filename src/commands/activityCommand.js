import fetch from 'isomorphic-fetch';

export const addActivity = async (
  storeId,
  menuId,
  size,
  yasai,
  ninniku,
  abura,
  karame
) => {
  const data = {
    storeId,
    menuId,
    size,
    yasai,
    ninniku,
    abura,
    karame,
    calorie: 0,
    imageUrl: 'TEST_INVALID_URL',
  };
  const res = await fetch('api/activities', {
    method: 'POST',
    body: JSON.stringify(data),
    headers: {
      'Content-Type': 'application/json',
      'X-CSRF-Token': window.csrfToken,
    },
    credentials: 'include',
  });
  if (!res.ok) throw Error;

  const newActivity = await res.json();
  return newActivity;
};
