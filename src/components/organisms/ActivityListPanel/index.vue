<template>
  <Panel class="activity-list-panel">
    <div class="activity-list-panel--header">
      最新の食事記録
    </div>
    <div v-if="activities.length">
      <table>
        <thead>
          <tr>
            <th>日付</th>
            <th>店舗</th>
            <th>メニュー</th>
          </tr>
        </thead>
        <tbody>
          <tr v-for="activity in activities" :key="activity.id">
            <td>{{ activity.createdAt | formatDate }}</td>
            <td>{{ activity.storeName }}</td>
            <td>{{ activity.menuName }}</td>
          </tr>
        </tbody>
      </table>
    </div>
    <div v-else class="activity-list-panel--no-activity">
      まだ、活動履歴はありません。
    </div>
  </Panel>
</template>

<script>
import moment from 'moment';
import Panel from '@/components/atoms/Panel';

export default {
  name: 'ActivityListPanel',
  components: {
    Panel,
  },
  filters: {
    formatDate(date) {
      if (!date) return '';
      return moment(date).format('YYYY/MM/DD hh:mm:ss');
    },
  },
  props: {
    activities: {
      type: Array,
      required: true,
    },
  },
};
</script>

<style lang="scss" scoped>
@import '@/components/styles/_colors.scss';
@import '@/components/styles/_table.scss';

.activity-list-panel {
  margin-bottom: 80px;

  &--header {
    font-size: 16px;
    padding: 16px;
    color: $black80;
    font-weight: bold;
  }

  &--no-activity {
    padding: 0 24px 24px 24px;
    font-size: 16px;
    color: $black80;
  }
}
</style>
