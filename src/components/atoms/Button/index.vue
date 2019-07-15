<template>
  <button
    :type="type"
    :disabled="disabled"
    :class="getButtonClass(buttonStyle)"
    @click="onClick"
  >
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
    disabled: {
      type: Boolean,
      default: false,
    },
    buttonStyle: {
      type: String,
      default: 'default',
    },
  },
  methods: {
    getButtonClass(buttonStyle = 'default') {
      switch (buttonStyle) {
        case 'primary': {
          return 'button__primary';
        }
        case 'bordered': {
          return 'button__bordered';
        }
        default:
          return 'button';
      }
    },
  },
};
</script>

<style lang="scss" scoped>
@import '@/components/styles/_colors.scss';

.button {
  color: $black60;
  font-weight: bold;
  font-size: 16px;
  padding: 6px 10px;
  border-radius: 4px;
  border: 1px solid transparent;
  transition: 0.3s;

  &:hover {
    background-color: $black10;
    cursor: pointer;
  }

  &:disabled {
    color: $black40;
    border: none;
    cursor: not-allowed;
  }
}

.button__primary {
  @extend .button;

  background-color: $yellow;
  border: 1px solid $yellow;

  &:hover {
    background-color: $yello-dark;
    border: 1px solid $yello-dark;
  }

  &:disabled {
    background-color: $yello-thin;
    border: 1px solid $yello-thin;
  }
}

.button__bordered {
  @extend .button;

  background-color: transparent;
  border: 1px solid $yellow;

  &:hover {
    background-color: $yellow;
    border: 1px solid $yellow;
  }

  &:active {
    background-color: $yellow;
    border: 1px solid $yellow;
  }

  &:disabled {
    color: $black40;
    background-color: $black40;
    border: 1px solid $black40;
  }
}
</style>
