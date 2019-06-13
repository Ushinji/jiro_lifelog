<template>
  <HeaderLayout>
    <div class="dashboard">
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
.dashboard {
  padding: 24px;
}
</style>
