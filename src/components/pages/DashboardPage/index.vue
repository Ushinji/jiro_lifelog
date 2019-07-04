<template>
  <HeaderLayout>
    <div class="container">
      <Loading v-if="loading" />
      <ErrorPage v-else-if="error" />
      <div v-else>
        <ActivityListPanel :activities="activities" />
      </div>
      <button type="button" @click="openModal">
        モーダルを開く
      </button>
      <Modal v-if="isOpenModal">
        <ActivityFormPanel
          :stores="stores"
          :menus="menus"
          :on-submit="addActivity"
        />
      </Modal>
    </div>
  </HeaderLayout>
</template>

<script>
import { getActivites } from '@/queries/activityQuery';
import { getStores } from '@/queries/storeQuery';
import { getMenus } from '@/queries/menuQuery';
import { addActivity as addActivityCommand } from '@/commands/activityCommand';
import HeaderLayout from '@/components/templates/HeaderLayout';
import ActivityListPanel from '@/components/organisms/ActivityListPanel';
import ActivityFormPanel from '@/components/organisms/ActivityFormPanel';
import ErrorPage from '@/components/organisms/ErrorPage';
import Loading from '@/components/molecules/Loading';
import Modal from '@/components/atoms/Modal';

export default {
  name: 'DashboardPage',
  components: {
    HeaderLayout,
    ActivityListPanel,
    ActivityFormPanel,
    ErrorPage,
    Loading,
    Modal,
  },
  data() {
    return {
      activities: [],
      stores: [],
      menus: [],
      isOpenModal: false,
      error: false,
      loading: false,
    };
  },
  async created() {
    try {
      this.loading = true;
      const [activities, stores, menus] = await Promise.all([
        getActivites(),
        getStores(),
        getMenus(),
      ]);
      this.activities = activities;
      this.stores = stores;
      this.menus = menus;
      this.loading = false;
    } catch {
      this.error = true;
      this.loading = false;
    }
  },
  methods: {
    openModal() {
      this.isOpenModal = true;
    },
    closeModal() {
      this.isOpenModal = false;
    },
    async addActivity(storeId, menuId, size, yasai, ninniku, abura, karame) {
      try {
        const newActivity = await addActivityCommand(
          storeId,
          menuId,
          size,
          yasai,
          ninniku,
          abura,
          karame
        );
        this.activities.push(newActivity);
        this.closeModal();
      } catch {
        // eslint-disable-next-line no-alert
        alert(
          'エラーが発生しました。お手数ですが、ページリロードしてやり直してください。'
        );
      }
    },
  },
};
</script>

<style lang="scss" scoped>
.container {
  padding: 24px 0;
}
</style>
