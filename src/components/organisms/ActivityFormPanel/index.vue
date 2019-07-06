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
            :options="activityParams.store"
          />
        </div>

        <div class="form--field-group">
          <div class="form--field-label">
            メニュー
          </div>
          <SelectField
            v-model="menuId"
            label="メニューを選択"
            :options="activityParams.menu"
          />
        </div>

        <div class="form--field-group">
          <div class="form--field-label">
            麺の量
          </div>
          <SelectField
            v-model="size"
            label="麺の量を選択"
            :options="activityParams.size"
          />
        </div>

        <div class="form--field-group">
          <div class="form--field-label">
            野菜の量
          </div>
          <SelectField
            v-model="yasai"
            label="野菜の量を選択"
            :options="activityParams.yasai"
          />
        </div>

        <div class="form--field-group">
          <div class="form--field-label">
            アブラの量
          </div>
          <SelectField
            v-model="abura"
            label="アブラの量を選択"
            :options="activityParams.abura"
          />
        </div>

        <div class="form--field-group">
          <div class="form--field-label">
            にんにくの量
          </div>
          <SelectField
            v-model="ninniku"
            label="にんにくの量を選択"
            :options="activityParams.ninniku"
          />
        </div>

        <div class="form--field-group">
          <div class="form--field-label">
            カラシの量
          </div>
          <SelectField
            v-model="karame"
            label="カラシの量を選択"
            :options="activityParams.karame"
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
    onSubmit: {
      type: Function,
      required: true,
    },
    activityParams: {
      type: Object,
      required: true,
    },
  },
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
