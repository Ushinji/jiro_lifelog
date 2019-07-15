<template>
  <div>
    <FlashProvider>
      <router-view />
    </FlashProvider>
  </div>
</template>

<script>
import FlashProvider from '@/components/providers/FlashProvider';

export default {
  name: 'App',
  components: {
    FlashProvider,
  },
};
</script>

<style lang="scss">
@import '@/components/styles/_base_styles.scss';
</style>
