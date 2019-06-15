<template>
  <div>
    <Header />
    <div>
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
