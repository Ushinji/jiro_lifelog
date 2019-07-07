<template>
  <button :type="type" class="add-activity-button" @click="onClick">
    <Icon>edit</Icon>
  </button>
</template>

<script>
import Icon from '@/components/atoms/Icon';

export default {
  name: 'AddActivityButton',
  components: {
    Icon,
  },
  props: {
    type: {
      type: String,
      default: 'button',
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

.add-activity-button {
  position: fixed;
  right: 20px;
  bottom: 20px;
  height: 64px;
  width: 64px;
  color: $white;
  font-size: 16px;
  font-weight: bold;
  border-radius: 50%;
  background-color: $red;
  text-align: center;
  text-decoration: none;
  cursor: pointer;
  box-shadow: 0 2px 2px 0 $black10, 0 3px 1px -2px $black10,
    0 1px 5px 0 $black10;

  .material-icons {
    font-size: 32px;
    line-height: 36px;
  }
}
</style>
