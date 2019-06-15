<template>
  <div>
    <Header />
    <div class="container">
      <slot />
    </div>
  </div>
</template>

<script>
import Header from '@/components/molecules/Header';

export default {
  name: 'HeaderLayout',
  components: {
    Header,
  },
};
</script>

<style lang="scss" scoped>
.container {
  width: 580px;
  margin: 0 auto;
}
</style>
