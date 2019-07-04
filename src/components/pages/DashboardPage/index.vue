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
      <button type="button" @click="closeModal">
        モーダルを閉じる
      </button>
      <Modal v-if="isOpenModal">
        <ActivityFormPanel :stores="stores" :menus="menus" />
      </Modal>
    </div>
  </HeaderLayout>
</template>

<script>
import { getActivites } from '@/queries/activityQuery';
import { getStores } from '@/queries/storeQuery';
import { getMenus } from '@/queries/menuQuery';
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
  },
};
</script>

<style lang="scss" scoped>
.container {
  padding: 24px 0;
}
</style>
