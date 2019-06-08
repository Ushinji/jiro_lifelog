<template>
  <div>
    <Header />
    <div>
      <router-view />
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
