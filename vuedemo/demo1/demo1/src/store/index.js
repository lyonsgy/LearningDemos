import Vue from 'vue'
import Vuex from 'vuex'
Vue.use(Vuex)
const BASE_URL = 'http://live.blog1024.cn/'
// const BASE_URL = 'http://wyethcollege.nplusgroup.net/'

export default new Vuex.Store({
  state: {
    authToken: '',
    shareAuthData: {},
    accountData: '',
    wxData:{},
    screenData:{},
    examData:null,// 保存当前试卷信息
    Debug:true,
    // Debug: false,
    // true为正式线上，false为测试线上
    onLine: true,
    BASE_URL
  },
  mutations: {
    setAuthToken (state, authToken) {
      state.authToken = authToken
    },
    setShareAuthData (state, shareAuthData) {
      state.shareAuthData = shareAuthData
    },
    setAccountData (state, accountData) {
      state.accountData = accountData
    },
    // 保存页面高度信息
    setScreenData (state, screenData) {
      state.screenData = screenData
    },
    // 保存试卷信息
    setExamData (state, examData) {
      state.examData = examData
    },
    setWxData (state, wxData) {
      state.wxData = wxData
    }
  }
})
