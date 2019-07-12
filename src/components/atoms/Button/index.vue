<template>
  <button :type="type" class="button" @click="onClick">
    <slot />
  </button>
</template>

<script>
export default {
  name: 'Button',
  props: {
    type: {
      type: String,
      required: true,
    },
    onClick: {
      type: Function,
      required: true,
    },
  },
};
</script>

<style lang="scss" scoped>
@import '@/components/styles/_colors.scss';

.button {
  color: $black80;
  font-weight: bold;
  font-size: 14px;
  padding: 6px 10px;
  background-color: $yellow;
  border-color: $yellow;
  border-radius: 4px;

  &:hover {
    background-color: $yello-dark;
    border-color: $yello-dark;
    cursor: pointer;
  }
}
</style>
