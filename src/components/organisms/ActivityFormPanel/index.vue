<template>
  <Panel style="width: 100%;">
    <div class="activity-form">
      <div class="activity-form--header">
        活動記録を作成する
      </div>

      <form @submit.prevent>
        <div class="activity-form--body">
          <table>
            <tbody>
              <tr>
                <td style="width: 40%;">
                  店名
                </td>
                <td>
                  <SelectField
                    v-model="storeId"
                    label="店名を選択"
                    error-label="店名を選択をしてください"
                    :validate="validateStoreId"
                    :options="activityParams.store"
                  />
                </td>
              </tr>
              <tr>
                <td style="width: 40%;">
                  メニュー
                </td>
                <td>
                  <SelectField
                    v-model="menuId"
                    label="メニューを選択"
                    error-label="メニューを選択をしてください"
                    :validate="validateMenuId"
                    :options="activityParams.menu"
                  />
                </td>
              </tr>
              <tr>
                <td style="width: 40%;">
                  麺の量
                </td>
                <td>
                  <SelectField
                    v-model="size"
                    label="麺の量を選択"
                    error-label="麺の量を選択してください"
                    :validate="validateSize"
                    :options="activityParams.size"
                  />
                </td>
              </tr>
              <tr>
                <td style="width: 40%;">
                  野菜の量
                </td>
                <td>
                  <SelectField
                    v-model="yasai"
                    label="野菜の量を選択"
                    error-label="野菜の量を選択してください"
                    :validate="validateYasai"
                    :options="activityParams.yasai"
                  />
                </td>
              </tr>
              <tr>
                <td style="width: 40%;">
                  アブラの量
                </td>
                <td>
                  <SelectField
                    v-model="abura"
                    label="アブラの量を選択"
                    error-label="アブラの量を選択してください"
                    :validate="validateAbura"
                    :options="activityParams.abura"
                  />
                </td>
              </tr>
              <tr>
                <td style="width: 40%;">
                  にんにくの量
                </td>
                <td>
                  <SelectField
                    v-model="ninniku"
                    label="にんにくの量を選択"
                    error-label="にんにくの量を選択してください"
                    :validate="validateNinniku"
                    :options="activityParams.ninniku"
                  />
                </td>
              </tr>
              <tr>
                <td style="width: 40%;">
                  カラシの量
                </td>
                <td>
                  <SelectField
                    v-model="karame"
                    label="カラシの量を選択"
                    error-label="カラシの量を選択してください"
                    :validate="validateKarame"
                    :options="activityParams.karame"
                  />
                </td>
              </tr>
            </tbody>
          </table>
        </div>

        <ButtonGroup>
          <Button type="button" :on-click="onClose">
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
      }
    },
  },
};
</script>

<style lang="scss" scoped>
@import '@/components/styles/_colors.scss';
@import '@/components/styles/_form.scss';
@import '@/components/styles/_table.scss';

.activity-form {
  padding: 24px 16px;
  height: 612px;
  max-height: calc(100vh - 80px);
  overflow-y: scroll;

  &--header {
    font-size: 16px;
    font-weight: bold;
    color: $black60;
    padding-left: 16px;
    margin-bottom: 24px;
  }

  &--body {
    margin-bottom: 32px;
  }
}
</style>
