<template>
  <div class="Toast" v-show="show">
    <span class="box">
    	{{content}}
    </span>
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
	content: {
	   default: '请注意！'
	},
	time: {
	   default: 1500
	}
  },
  created () {
  	let _this = this
    if (_this.time > 0) {
      setTimeout(function(){
        _this.show = false
      }, _this.time)
    }
  },
  methods: {
    toggleShow () {
      this.show = !this.show
    }
  }
}
</script>

<style>
  @import './Toast.css'
</style>
