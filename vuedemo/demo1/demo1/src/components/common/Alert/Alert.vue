<template>
  <div class="Alert" v-show="show">
    <div class="box">
    	<div class="title">{{title}}</div>
    	<div class="content" v-html="content"></div>
    	<div class="btns">
    		<a href="javascript:void(0)" @click="toggleShow">{{btnText}}</a>
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
  	btnText: {
  	   default: '确定'
  	},
    callback: Function
  },
  methods: {
    toggleShow () {
      let  _this = this
      _this.show = !_this.show
      if (_this.callback) {
        _this.callback()
      }
    }
  }
}
</script>

<style>
  @import './Alert.css'
</style>
