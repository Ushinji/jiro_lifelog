import Vue from 'vue'
import VueRouter from 'vue-router';
import App from './App';
import routes from './routes';

Vue.use(VueRouter);
const router = new VueRouter({ routes });

new Vue({
  el: '#root',
  router,
  render: h => h(App),
});
