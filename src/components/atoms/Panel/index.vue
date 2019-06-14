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
@import '@/components/styles/_colors.scss';

.panel {
  background-color: $white;
  border: 1px solid $black10;
  border-radius: 4px;
  box-shadow: 0px 0px 4px $black10;
}
</style>
