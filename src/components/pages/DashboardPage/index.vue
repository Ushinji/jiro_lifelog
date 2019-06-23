<template>
  <HeaderLayout>
    <div class="container">
      <ErrorPage v-if="error" />
      <div v-else>
        <ActivityListPanel :activities="activities" />
      </div>
    </div>
  </HeaderLayout>
</template>

<script>
import { getActivites } from '@/queries/activityQuery';
import HeaderLayout from '@/components/templates/HeaderLayout';
import ActivityListPanel from '@/components/organisms/ActivityListPanel';
import ErrorPage from '@/components/organisms/ErrorPage';

export default {
  name: 'DashboardPage',
  components: {
    HeaderLayout,
    ActivityListPanel,
    ErrorPage,
  },
  data() {
    return {
      activities: [],
      error: false,
    };
  },
  async created() {
    try {
      const activities = await getActivites();
      this.activities = activities;
    } catch {
      this.error = true;
    }
  },
};
</script>

<style lang="scss" scoped>
.container {
  padding: 24px 0;
}
</style>
