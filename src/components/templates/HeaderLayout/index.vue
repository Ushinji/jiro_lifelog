<template>
  <div>
    <div class="main-header">
      <Logo />
    </div>
    <div>
      <router-view />
    </div>
  </div>
</template>

<script>
import Logo from '@/components/atoms/Logo';

export default {
  name: 'DashboardPage',
  components: {
    Logo,
  },
};
</script>

<style lang="scss" scoped>
.main-header {
  padding: 8px;
  background-color: #ffe600;
  text-align: center;
  margin-bottom: 12px;
}
</style>
