<template>
  <HeaderLayout>
    <div class="container">
      <Loading v-if="loading" />
      <ErrorPage v-else-if="error" />
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
import Loading from '@/components/molecules/Loading';

export default {
  name: 'DashboardPage',
  components: {
    HeaderLayout,
    ActivityListPanel,
    ErrorPage,
    Loading,
  },
  data() {
    return {
      activities: [],
      error: false,
      loading: false,
    };
  },
  async created() {
    try {
      this.loading = true;
      const activities = await getActivites();
      this.activities = activities;
      this.loading = false;
    } catch {
      this.error = true;
      this.loading = false;
    }
  },
};
</script>

<style lang="scss" scoped>
.container {
  padding: 24px 0;
}
</style>
