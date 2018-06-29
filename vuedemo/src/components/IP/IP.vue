<template>
  <div class="hello">
    <div class="top-bar">
      <a v-for="(bar, index) in bars" :key="index" :class="{barActive: index == barIndex}"
         @click="changeBar(bar.id, index)"
         href="javascript:void(0)">{{ bar.msg }}</a>
    </div>
    <div class="main" style="background-color: #5F52A0">
      <ul>
        <li class="ip-item-list" v-for="item in items" :style="{background: 'url(' + item.cover + ')'}">
          <a class="top">
            <h1 class="ip-title">{{ item.title }}<br/>{{ item.message }}</h1>
            <h2 class="ip-content">{{ item.content }}</h2>
          </a>
          <a class="bottom">
            <h1 class="ip-price">FREE</h1>
            <h2 class="ip-type">冒险游戏</h2>
          </a>
          <button class="ip-open">立即体验</button>
        </li>
      </ul>
    </div>
    <!--<div class="main" style="background-color: #F7CC45">-->
      <!--<ul>-->
        <!--<li class="ip-item-list" v-for="item in items" :style="{background: 'url(' + item.cover + ')'}">-->
          <!--<a class="top">-->
            <!--<h1 class="ip-title">{{ item.title }}<br/>{{ item.message }}</h1>-->
            <!--<h2 class="ip-content">{{ item.content }}</h2>-->
          <!--</a>-->
          <!--<a class="bottom">-->
            <!--<h1 class="ip-price">FREE</h1>-->
            <!--<h2 class="ip-type">冒险游戏</h2>-->
          <!--</a>-->
          <!--<button class="ip-open">立即体验</button>-->
        <!--</li>-->
      <!--</ul>-->
    <!--</div>-->
    <div class="footer">
      <a v-for="(tag, index) in tags" :key="index" :class="{active: index == cur}" @click="changeTag(tag.id, index)" href="javascript:void(0)">{{ tag.msg }}</a>
    </div>
  </div>
</template>

<script>
  export default {
    data() {
      return {
        cur: 0,
        barIndex: 0,
        bars: [
          {msg: '微信表情包'},
          {msg: 'IP形象设定'},
        ],
        tags: [
          {msg: 'GAME'},
          {msg: 'WVI'},
          {msg: 'IP'},
          {msg: 'MINE'}
        ],
        items: [
          {
            message: 'escape',
            title: 'nightmare',
            content: '逃离梦魇',
            cover: '../../assets/img/game0.png'
          },
          {
            message: 'escape',
            title: 'nightmare',
            content: '逃离梦魇',
            cover: '../../assets/img/game1.png'
          },
          {
            message: 'escape',
            title: 'nightmare',
            content: '逃离梦魇',
            cover: '../../assets/img/game2.png'
          },
        ]
      }
    },
    methods: {
      changeBar(id, index) {
        let _this = this
        _this.barIndex = index
      },
      changeTag(id, index) {
        let _this = this
        _this.cur = index
      }
    }
  }
</script>

<!-- Add "scoped" attribute to limit CSS to this component only -->
<style scoped lang="stylus">
  @import "./IP.styl"
</style>
