<template>
  <HeaderLayout>
    <div class="container">
      <ActivityListPanel />
    </div>
  </HeaderLayout>
</template>

<script>
import HeaderLayout from '@/components/templates/HeaderLayout';
import ActivityListPanel from '@/components/organisms/ActivityListPanel';

export default {
  name: 'DashboardPage',
  components: {
    HeaderLayout,
    ActivityListPanel,
  },
};
</script>

<style lang="scss" scoped>
.container {
  padding: 24px 0;
}
</style>
