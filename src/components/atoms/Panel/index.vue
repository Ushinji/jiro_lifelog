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
  border: 1px solid #f1f1f1;
}
</style>
