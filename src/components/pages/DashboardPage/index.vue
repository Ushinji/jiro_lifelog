<template>
  <HeaderLayout>
    <div class="container">
      <div v-if="error" class="error-message">
        エラーが発生しました。
      </div>
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

.error-message {
  text-align: center;
  font-weight: bold;
}
</style>
