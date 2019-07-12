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
  @media (max-width: 611px) {
    padding: 0 16px;
  }

  @media (min-width: 612px) {
    width: 580px;
  }

  margin: 0 auto;
}
</style>
