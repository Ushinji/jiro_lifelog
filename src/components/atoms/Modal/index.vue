<template>
  <div>
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

.modal {
  position: fixed;
  z-index: 11;
  top: 0;
  left: 0;
  display: flex;
  justify-content: center;
  align-items: center;
  height: 100vh;
  width: 100vw;
  animation: slide-up 0.5s;
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
