<template>
  <Panel style="width: 100%;">
    <div class="activity-form">
      <div class="activity-form--header">
        食事記録を作成する
      </div>

      <form @submit.prevent>
        <div class="activity-form--body">
          <div class="form--field-group">
            <div class="form--field-label">
              店名
            </div>
            <SelectField
              v-model="storeId"
              label="店名を選択"
              error-label="店名を選択をしてください"
              :validate="validateStoreId"
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
              error-label="メニューを選択をしてください"
              :validate="validateMenuId"
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
              error-label="麺の量を選択してください"
              :validate="validateSize"
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
              error-label="野菜の量を選択してください"
              :validate="validateYasai"
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
              error-label="アブラの量を選択してください"
              :validate="validateAbura"
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
              error-label="にんにくの量を選択してください"
              :validate="validateNinniku"
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
              error-label="カラシの量を選択してください"
              :validate="validateKarame"
              :options="activityParams.karame"
            />
          </div>
        </div>

        <div class="activity-form--footer">
          <ButtonGroup>
            <Button type="button" button-style="bordered" :on-click="onClose">
              戻る
            </Button>
            <Button
              type="submit"
              button-style="primary"
              :disabled="!validateForm() || isLoading"
              :on-click="handleSubmit"
            >
              {{ isLoading ? '送信中...' : '作成する' }}
            </Button>
          </ButtonGroup>
        </div>
      </form>
    </div>
  </Panel>
</template>

<script>
import Panel from '@/components/atoms/Panel';
import Button from '@/components/atoms/Button';
import SelectField from '@/components/molecules/SelectField';
import ButtonGroup from '@/components/molecules/ButtonGroup';

export default {
  name: 'ActivityFormPanel',
  inject: ['useFlash'],
  components: {
    Panel,
    SelectField,
    Button,
    ButtonGroup,
  },
  props: {
    onSubmit: {
      type: Function,
      required: true,
    },
    onClose: {
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
      isLoading: false,
    };
  },
  methods: {
    validateStoreId(value) {
      return value !== '';
    },
    validateMenuId(value) {
      return value !== '';
    },
    validateSize(value) {
      return value !== '';
    },
    validateYasai(value) {
      return value !== '';
    },
    validateAbura(value) {
      return value !== '';
    },
    validateNinniku(value) {
      return value !== '';
    },
    validateKarame(value) {
      return value !== '';
    },
    validateForm() {
      return (
        !this.storeId.isError &&
        !this.menuId.isError &&
        !this.size.isError &&
        !this.yasai.isError &&
        !this.abura.isError &&
        !this.ninniku.isError &&
        !this.karame.isError
      );
    },
    startLoding() {
      this.isLoading = true;
    },
    finishLoding() {
      this.isLoading = false;
    },
    async handleSubmit() {
      if (this.validateForm()) {
        this.startLoding();
        await this.onSubmit(
          this.storeId.value,
          this.menuId.value,
          this.size.value,
          this.yasai.value,
          this.ninniku.value,
          this.abura.value,
          this.karame.value
        );
        this.finishLoding();
        this.useFlash('食事記録を作成しました！');
      }
    },
  },
};
</script>

<style lang="scss" scoped>
@import '@/components/styles/_colors.scss';
@import '@/components/styles/_form.scss';

.activity-form {
  min-height: calc(100vh - 144px);

  form {
    height: 100%;
  }

  &--header {
    padding: 16px;
    font-size: 16px;
    font-weight: bold;
    color: $black60;
    height: 24px;
    border-bottom: 1px solid $black5;
  }

  &--body {
    padding: 16px;
    height: calc(100vh - 300px);
    overflow-y: scroll;
  }

  &--footer {
    box-shadow: 0 0 4px $black10;
    padding: 16px;
    background-color: $black1;
  }
}
</style>
