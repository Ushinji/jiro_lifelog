<template>
  <div>
    <ul>
      <li>
        <router-link to="/hello">
          Go to Hello
        </router-link>
      </li>
      <li>
        <router-link to="/counter">
          Go to Counter
        </router-link>
      </li>
    </ul>
  </div>
</template>

<script>
export default {
  name: 'Top',
};
</script>
