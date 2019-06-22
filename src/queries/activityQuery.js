import fetch from 'isomorphic-fetch';

export const getActivites = async () => {
  const res = await fetch('api/activities', {
    credentials: 'include',
  });
  if (!res.ok) throw Error;

  const data = await res.json();
  return data;
};
