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
.header {
  padding: 8px;
  background-color: #ffe600;
  text-align: center;
  margin-bottom: 12px;
}
</style>
