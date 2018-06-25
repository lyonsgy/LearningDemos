import { util } from './util'
// import axios from './axios'
import machine from './machine'
import manageImg from './manageImgJs'
import qs from 'qs'
import Alert from '../../components/common/Alert/Alert.vue'
import Confirm from '../../components/common/Confirm/Confirm.vue'
import Toast from '../../components/common/Toast/Toast.vue'

export default {
  install(Vue, options) {
    Vue.prototype.util = util;
    Vue.prototype.api = api;
    Vue.prototype.$wxsdk = wxsdk;
    Vue.prototype.$http = axios
    Vue.prototype.$qs = qs
    Vue.prototype.$machine = machine
    Vue.prototype.$manageImg = manageImg

    /**
     * Alert弹出框，2种传参方式
     * --------
     * @param  {[String]}  options 提示文字
     * 例：this.$alert('密码错误！')
     * --------
     * @param  {[Object]}  options {title:'标题文字', content:'提示文字', btnText:'按钮文字', callback:点击确定按钮触发事件}
     * 例：this.$alert({title:'注意', content:'密码错误', btnText:'关闭', callback: function(){dosomething()}}})
     */
    if (document.getElementsByClassName('Alert').length < 1) {
      let alertTpl = Vue.extend(Alert);
      let $vm = new alertTpl();
      let tpl = $vm.$mount().$el;
      document.body.appendChild(tpl);
      Vue.prototype.$alert = function(options) {
        if (typeof options === 'string') {
          $vm.content = options;
        } else if (typeof options === 'object') {
          Object.assign($vm, options);
        } else if (typeof options === 'undefined') {
          return false;
        }
        $vm.show = true;
      };
    }

    /**
     * Confirm弹出框
     * @param  {[Object]}  options {title:'标题文字', content:'提示文字', okText:'确定按钮文字', cancelText:'取消按钮文字', okFun:点击确定按钮触发事件, cancelFun:点击取消按钮触发事件}
     * 例：this.$confirm({title:'注意', content:'确认删除吗？', okText:'确认', cancelText:'取消', okFun: function(){dosomething()}})
     */
    if (document.getElementsByClassName('Confirm').length < 1) {
      let confirmTpl = Vue.extend(Confirm);
      let $vm = new confirmTpl();
      let tpl = $vm.$mount().$el;
      document.body.appendChild(tpl);
      Vue.prototype.$confirm = function(options) {
        if (typeof options === 'object') {
          Object.assign($vm, options);
        } else if (typeof options === 'undefined') {
          return false;
        }
        $vm.show = true;
      };
    }

    /**
     * Toast弹出框，2种传参方式
     * --------
     * @param  {[String]}  options 提示文字
     * 例：this.$toastShow('密码错误！') //默认1500ms后隐藏
     * --------
     * @param  {[Object]}  options {content:'提示文字', time: 时间}
     * 例：this.$toast.show({content:'密码错误！', time: 2000})
     * 如果time=0，toast框不隐藏，需要使用this.$toastHide()隐藏
     */
    if (document.getElementsByClassName('Toast').length < 1) {
      let toastTpl = Vue.extend(Toast);
      let $vm = new toastTpl();
      let tpl = $vm.$mount().$el;
      document.body.appendChild(tpl);
      Vue.prototype.$toastShow = function(options) {
        if (typeof options === 'string') {
          $vm.content = options;
        } else if (typeof options === 'object') {
          Object.assign($vm, options);
        } else if (typeof options === 'undefined') {
          return false;
        }
        $vm.show = true;
      };
      Vue.prototype.$toastHide = function(options) {
        $vm.show = false;
      };
    }
  }
};
