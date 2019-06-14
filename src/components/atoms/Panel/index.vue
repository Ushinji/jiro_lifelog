<template>
  <div class="panel">
    <slot />
  </div>
</template>

<script>
export default {
  name: 'Panel',
};
</script>

<style lang="scss" scoped>
.panel {
  background-color: white;
  border: 1px solid #dfe1e5;
  border-radius: 4px;
  box-shadow: 0px 0px 4px rgba(51, 23, 20, 0.2);
}
</style>
