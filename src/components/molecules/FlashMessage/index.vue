<template>
  <div v-if="isActive" class="flash-message">
    <div>{{ message }}</div>
  </div>
</template>

<script>
export default {
  name: 'FlashMessage',
  props: {
    isActive: {
      type: Boolean,
      required: true,
    },
    message: {
      type: String,
      required: true,
    },
  },
};
</script>

<style lang="scss" scoped>
@import '@/components/styles/_colors.scss';

.flash-message {
  position: fixed;
  left: 32px;
  bottom: 32px;
  display: flex;
  background-color: $yellow-pale;
  color: $black60;
  line-height: 24px;
  padding: 8px 16px;
  box-shadow: 0 1px 2px $black80;
  border-radius: 2px;
  z-index: 100;
  animation: slide-up 0.5s;
}

@keyframes slide-up {
  0% {
    opacity: 0;
    transform: translateX(-2%);
  }

  100% {
    opacity: 1;
    transform: translateX(0%);
  }
}
</style>
