<template>
  <div class="header">
    <Logo />
  </div>
</template>

<script>
import Logo from '@/components/atoms/Logo';

export default {
  name: 'Header',
  components: {
    Logo,
  },
};
</script>

<style lang="scss" scoped>
@import '@/components/styles/_colors.scss';

.header {
  padding: 8px;
  background-color: $yellow-pale;
  text-align: center;
}
</style>
