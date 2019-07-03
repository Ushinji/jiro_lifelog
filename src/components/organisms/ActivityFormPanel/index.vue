<template>
  <Panel>
    <div class="activity-form">
      <div class="activity-form--header">
        活動記録を作成する
      </div>
      <form>
        <div class="form--field-group">
          <div class="field-label">
            麺の量
          </div>
          <SelectField
            v-model="size"
            label="麺の量を選択"
            :options="sizeOptions"
          />
        </div>

        <div class="form--field-group">
          <div class="form--field-label">
            野菜の量
          </div>
          <SelectField
            v-model="yasai"
            label="野菜の量を選択"
            :options="yasaiOptions"
          />
        </div>

        <div class="form--field-group">
          <div class="form--field-label">
            にんにくの量
          </div>
          <SelectField
            v-model="ninniku"
            label="にんにくの量を選択"
            :options="ninnikuOptions"
          />
        </div>

        <div class="form--field-group">
          <div class="form--field-label">
            カラシの量
          </div>
          <SelectField
            v-model="karame"
            label="カラシの量を選択"
            :options="karameOptions"
          />
        </div>
      </form>
    </div>
  </Panel>
</template>

<script>
import Panel from '@/components/atoms/Panel';
import SelectField from '@/components/molecules/SelectField';

export default {
  name: 'ActivityFormPanel',
  components: {
    Panel,
    SelectField,
  },
  props: {},
  data() {
    return {
      storeId: '',
      menuId: '',
      size: '',
      yasai: '',
      ninniku: '',
      abura: '',
      karame: '',
    };
  },
  computed: {
    sizeOptions: () => [
      {
        id: 1,
        value: 'small',
        label: '小',
      },
      {
        id: 2,
        value: 'large',
        label: '大',
      },
    ],
    yasaiOptions: () => [
      {
        id: 1,
        value: 'small',
        label: '小',
      },
      {
        id: 2,
        value: 'normal',
        label: 'ノーコール',
      },
      {
        id: 3,
        value: 'large',
        label: 'マシ',
      },
      {
        id: 4,
        value: 'mashimashi',
        label: 'マシマシ',
      },
    ],
    karameOptions: () => [
      {
        id: 1,
        value: 'small',
        label: '小',
      },
      {
        id: 2,
        value: 'normal',
        label: 'ノーコール',
      },
      {
        id: 3,
        value: 'large',
        label: 'マシ',
      },
      {
        id: 4,
        value: 'mashimashi',
        label: 'マシマシ',
      },
    ],
  },
};
</script>

<style lang="scss" scoped>
@import '@/components/styles/_colors.scss';
@import '@/components/styles/_form.scss';

.activity-form {
  padding: 16px;
  width: 480px;

  &--header {
    font-size: 16px;
    font-weight: bold;
    color: $black60;
    margin-bottom: 32px;
  }
}
</style>
