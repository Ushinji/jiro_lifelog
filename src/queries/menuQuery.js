import fetch from 'isomorphic-fetch';

export const getMenus = async () => {
  const res = await fetch('api/menus', {
    credentials: 'include',
  });
  if (!res.ok) throw Error;

  const data = await res.json();
  return data;
};
