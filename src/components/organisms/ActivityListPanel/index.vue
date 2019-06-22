<template>
  <Panel>
    <div class="header">
      あなたの食事履歴
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
            <td>{{ activity.created_at }}</td>
            <td>{{ activity.store_name }}</td>
            <td>{{ activity.menu_name }}</td>
          </tr>
        </tbody>
      </table>
    </div>
    <div v-else>
      活動履歴はありません。
    </div>
  </Panel>
</template>

<script>
import Panel from '@/components/atoms/Panel';

export default {
  name: 'ActivityListPanel',
  components: {
    Panel,
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

.header {
  padding: 24px;
  font-size: 14px;
  color: $black80;
  font-weight: bold;
}
</style>
