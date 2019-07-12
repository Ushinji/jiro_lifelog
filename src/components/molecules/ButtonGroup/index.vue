<template>
  <div class="button-group">
    <slot />
  </div>
</template>

<script>
export default {
  name: 'ButtonGroup',
};
</script>

<style lang="scss" scoped>
.button-group {
  display: flex;
  justify-content: space-between;

  button {
    width: 45%;
  }
}
</style>
