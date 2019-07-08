<template>
  <div class="container">
    <div class="modal">
      <slot />
    </div>
    <div class="overlay" />
  </div>
</template>

<script>
export default {
  name: 'Modal',
};
</script>

<style lang="scss" scoped>
@import '@/components/styles/_colors.scss';

.container {
  z-index: 10;
  position: fixed;
  top: 0;
  left: 0;
  right: 0;
  bottom: 0;
  display: flex;
  align-items: center;
  justify-content: center;
}

.modal {
  z-index: 11;
  animation: slide-up 0.5s;

  @media (max-width: 431px) {
    padding: 0 16px;
    width: 100%;
  }

  @media (min-width: 432px) {
    width: 400px;
  }
}

@keyframes slide-up {
  0% {
    opacity: 0;
    transform: translateY(2%);
  }

  100% {
    opacity: 1;
    transform: translateY(0%);
  }
}

.overlay {
  position: fixed;
  z-index: 10;
  top: 0;
  left: 0;
  width: 100%;
  height: 100%;
  background-color: $black100;
  opacity: 0.5;
}
</style>
