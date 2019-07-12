import fetch from 'isomorphic-fetch';

export const getStores = async () => {
  const res = await fetch('api/stores', {
    credentials: 'include',
  });
  if (!res.ok) throw Error;

  const data = await res.json();
  return data;
};
