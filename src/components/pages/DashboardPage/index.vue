<template>
  <HeaderLayout>
    <div class="container">
      <ActivityListPanel />
    </div>
  </HeaderLayout>
</template>

<script>
import fetch from 'isomorphic-fetch';
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
    };
  },
  async created() {
    const res = await fetch('api/activities', {
      credentials: 'include',
    });
    const data = await res.json();
    this.activities = data;
  },
};
</script>

<style lang="scss" scoped>
.container {
  padding: 24px 0;
}
</style>
