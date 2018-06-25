// The Vue build version to load with the `import` command
// (runtime-only or standalone) has been set in webpack.base.conf with an alias.
import Vue from 'vue'
import App from './App'
import router from './router'
import store from './store'
import common from "./assets/js/common";

Vue.use(common)
Vue.config.productionTip = false

/* eslint-disable no-new */
new Vue({
  el: '#app',
  router,
  store,
  template: '<App/>',
  components: { App }
})

import Vuex from 'vuex';
import vuexI18n from 'vuex-i18n';
Vue.use(Vuex);
const oStore = new Vuex.Store({
  modules: {
    i18n: vuexI18n.store
  }
});
Vue.use(vuexI18n.plugin, oStore);
const translationsEn = {
  "content": "This is some {type} content"
};
