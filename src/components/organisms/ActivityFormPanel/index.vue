<template>
  <Panel>
    <div class="activity-form">
      <div class="activity-form--header">
        活動記録を作成する
      </div>
      <form @submit.prevent>
        <div class="form--field-group">
          <div class="form--field-label">
            店名
          </div>
          <SelectField
            v-model="storeId"
            label="店名を選択"
            error-label="選択をしてください"
            :options="storeOptions"
            :validate="value => value !== ''"
          />
        </div>

        <div class="form--field-group">
          <div class="form--field-label">
            メニュー
          </div>
          <SelectField
            v-model="menuId"
            label="メニューを選択"
            error-label="選択をしてください"
            :options="menuOptions"
            :validate="value => value !== ''"
          />
        </div>

        <div class="form--field-group">
          <div class="form--field-label">
            麺の量
          </div>
          <SelectField
            v-model="size"
            label="麺の量を選択"
            error-label="選択をしてください"
            :options="sizeOptions"
            :validate="value => value !== ''"
          />
        </div>

        <div class="form--field-group">
          <div class="form--field-label">
            野菜の量
          </div>
          <SelectField
            v-model="yasai"
            label="野菜の量を選択"
            error-label="選択をしてください"
            :options="yasaiOptions"
            :validate="value => value !== ''"
          />
        </div>

        <div class="form--field-group">
          <div class="form--field-label">
            アブラの量
          </div>
          <SelectField
            v-model="abura"
            label="アブラの量を選択"
            error-label="選択をしてください"
            :options="aburaOptions"
            :validate="value => value !== ''"
          />
        </div>

        <div class="form--field-group">
          <div class="form--field-label">
            にんにくの量
          </div>
          <SelectField
            v-model="ninniku"
            label="にんにくの量を選択"
            error-label="選択をしてください"
            :options="ninnikuOptions"
            :validate="value => value !== ''"
          />
        </div>

        <div class="form--field-group">
          <div class="form--field-label">
            カラシの量
          </div>
          <SelectField
            v-model="karame"
            label="カラシの量を選択"
            error-label="選択をしてください"
            :options="karameOptions"
            :validate="value => value !== ''"
          />
        </div>
        <Button type="submit" :on-click="handleSubmit">
          作成する
        </Button>
      </form>
    </div>
  </Panel>
</template>

<script>
import Panel from '@/components/atoms/Panel';
import Button from '@/components/atoms/Button';
import SelectField from '@/components/molecules/SelectField';

export default {
  name: 'ActivityFormPanel',
  components: {
    Panel,
    SelectField,
    Button,
  },
  props: {
    stores: {
      type: Array,
      required: true,
    },
    menus: {
      type: Array,
      required: true,
    },
    onSubmit: {
      type: Function,
      required: true,
    },
  },
  data() {
    return {
      storeId: {
        value: '',
        isError: true,
      },
      menuId: {
        value: '',
        isError: true,
      },
      size: {
        value: '',
        isError: true,
      },
      yasai: {
        value: '',
        isError: true,
      },
      ninniku: {
        value: '',
        isError: true,
      },
      abura: {
        value: '',
        isError: true,
      },
      karame: {
        value: '',
        isError: true,
      },
    };
  },
  computed: {
    storeOptions() {
      return this.stores.map(store => {
        return {
          id: store.id,
          value: store.id,
          label: store.name,
        };
      });
    },
    menuOptions() {
      return this.menus.map(menu => {
        return {
          id: menu.id,
          value: menu.id,
          label: menu.name,
        };
      });
    },
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
    aburaOptions: () => [
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
      {
        id: 5,
        value: 'crazy',
        label: 'ザブトン',
      },
    ],
    ninnikuOptions: () => [
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
  methods: {
    handleSubmit() {
      this.onSubmit(
        this.storeId,
        this.menuId,
        this.size,
        this.yasai,
        this.ninniku,
        this.abura,
        this.karame
      );
    },
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
