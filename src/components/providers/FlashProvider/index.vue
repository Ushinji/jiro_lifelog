<template>
  <div>
    <slot />
    <FlashMessage :is-active="isActive" :message="message" />
  </div>
</template>

<script>
import FlashMessage from '@/components/molecules/FlashMessage';

export default {
  name: 'FlashProvider',
  components: {
    FlashMessage,
  },
  data() {
    return {
      isActive: false,
      message: '',
    };
  },
  methods: {
    useFalsh(message) {
      this.isActive = true;
      this.message = message;

      setTimeout(() => {
        this.isActive = false;
        this.message = '';
      }, 3000);
    },
  },
  provide() {
    return {
      useFlash: this.useFalsh,
    };
  },
};
</script>
