<template>
  <HeaderLayout>
    <div class="container">
      <Loading v-if="loading" />
      <ErrorPage v-else-if="error" />
      <div v-else>
        <ActivityListPanel :activities="activities" />
      </div>
      <Modal v-if="isOpenModal">
        <ActivityFormPanel
          :activity-params="activityParams"
          :on-submit="addActivity"
          :on-close="closeModal"
        />
      </Modal>
      <AddActivityButton :on-click="openModal" />
    </div>
  </HeaderLayout>
</template>

<script>
import { getActivites, getActivityParams } from '@/queries/activityQuery';
import { addActivity as addActivityCommand } from '@/commands/activityCommand';
import HeaderLayout from '@/components/templates/HeaderLayout';
import ActivityListPanel from '@/components/organisms/ActivityListPanel';
import ActivityFormPanel from '@/components/organisms/ActivityFormPanel';
import ErrorPage from '@/components/organisms/ErrorPage';
import Loading from '@/components/molecules/Loading';
import Modal from '@/components/atoms/Modal';
import AddActivityButton from '@/components/atoms/AddActivityButton';

export default {
  name: 'DashboardPage',
  components: {
    HeaderLayout,
    ActivityListPanel,
    ActivityFormPanel,
    ErrorPage,
    Loading,
    Modal,
    AddActivityButton,
  },
  inject: ['useFlash'],
  data() {
    return {
      activities: [],
      activityParams: {},
      isOpenModal: false,
      error: false,
      loading: false,
    };
  },
  async created() {
    try {
      this.loading = true;
      const [activities, activityParams] = await Promise.all([
        getActivites(),
        getActivityParams(),
      ]);
      this.activities = activities;
      this.activityParams = activityParams;
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
        await addActivityCommand(
          storeId,
          menuId,
          size,
          yasai,
          ninniku,
          abura,
          karame
        );
        const activites = await getActivites();
        this.activities = activites;
        this.closeModal();
        window.scrollTo(0, 0);
        this.useFlash('食事記録を作成しました！');
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
