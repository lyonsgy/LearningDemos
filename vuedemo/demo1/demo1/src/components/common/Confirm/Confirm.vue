<template>
  <div class="Confirm" v-show="show">
    <div class="box">
    	<div class="title">{{title}}</div>
    	<div class="content">{{content}}</div>
    	<div class="btns">
    		<a href="javascript:void(0)" @click="cancel" class="cancel">{{cancelText}}</a>
    		<a href="javascript:void(0)" @click="ok">{{okText}}</a>
    	</div>
    </div>
  </div>
</template>

<script>
export default {
  data() {
  	return {
  	}
  },
  props: {
  	show: {
	   default: false
  	},
  	title: {
  	   default: '提示'
  	},
  	content: {
  	   default: '请注意！'
  	},
  	okText: {
  	   default: '确定'
  	},
  	cancelText: {
  	   default: '取消'
  	},
  	okFun: Function,
  	cancelFun: Function
  },
  methods: {
    cancel () {
      let _this = this
      _this.show = false
      if (_this.cancelFun) {
      	_this.cancelFun()
      }
    },
    ok () {
      let _this = this
      _this.show = false
      if (_this.okFun) {
      	_this.okFun()
      }
    }
  }
}
</script>

<style>
  @import './Confirm.css'
</style>
