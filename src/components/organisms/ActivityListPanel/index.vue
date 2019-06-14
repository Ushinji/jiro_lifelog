<template>
  <Panel>
    <div class="header">
      あなたの食事履歴
    </div>
    <table>
      <thead>
        <tr>
          <th>日付</th>
          <th>店舗</th>
          <th>メニュー</th>
        </tr>
      </thead>
      <tbody>
        <tr>
          <td>2019/06/01 16:28:27</td>
          <td>三田本店</td>
          <td>ぶた入りラーメン</td>
        </tr>
        <tr>
          <td>2019/06/01 16:28:27</td>
          <td>三田本店</td>
          <td>ぶた入りラーメン</td>
        </tr>
        <tr>
          <td>2019/06/01 16:28:27</td>
          <td>三田本店</td>
          <td>ぶた入りラーメン</td>
        </tr>
      </tbody>
    </table>
  </Panel>
</template>

<script>
import Panel from '@/components/atoms/Panel';

export default {
  name: 'ActivityListPanel',
  components: {
    Panel,
  },
};
</script>

<style lang="scss" scoped>
@import '@/components/styles/_table.scss';

.header {
  padding: 24px;
  font-size: 14px;
  color: #343a40;
  font-weight: bold;
}
</style>
