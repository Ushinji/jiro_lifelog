import Vue from 'vue';
import VueRouter from 'vue-router';
import App from './components/App';
import routes from './components/routes';

Vue.use(VueRouter);
const router = new VueRouter({ mode: 'history', routes });

const app = new Vue({
  router,
  render: h => h(App),
});

app.$mount('#root');
