<template>
  <HeaderLayout>
    <div class="container">
      <ActivityListPanel :activities="activities" />
    </div>
  </HeaderLayout>
</template>

<script>
import { getActivites } from '@/queries/activityQuery';
import HeaderLayout from '@/components/templates/HeaderLayout';
import ActivityListPanel from '@/components/organisms/ActivityListPanel';

export default {
  name: 'DashboardPage',
  components: {
    HeaderLayout,
    ActivityListPanel,
  },
  data() {
    return {
      activities: [],
      error: false,
    };
  },
  async created() {
    const activities = await getActivites();
    this.activities = activities;
  },
};
</script>

<style lang="scss" scoped>
.container {
  padding: 24px 0;
}
</style>
