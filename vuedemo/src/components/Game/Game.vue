<template>
  <div class="hello">
    <div class="main" style="background-color: #F7CC45">
      <ul>
        <li class="game-item-list" v-for="item in items" :style="{background: 'url(' + item.cover + ')'}">
          <a class="top">
            <h1 class="game-title">{{ item.title }}<br/>{{ item.message }}</h1>
            <h2 class="game-content">{{ item.content }}</h2>
          </a>
          <a class="bottom">
            <h1 class="game-price">FREE</h1>
            <h2 class="game-type">冒险游戏</h2>
          </a>
          <button class="game-open">立即体验</button>
        </li>
      </ul>
    </div>
    <div class="footer">
      <a v-for="(tag, index) in tags" :key="index" :class="{active: index == cur}" @click="changeTag(tag.id, index)"
         href="javascript:void(0)">{{ tag.msg }}</a>
    </div>
  </div>
</template>

<script>
  export default {
    data() {
      return {
        cur: 0,
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
      changeTag(id, index) {
        let _this = this
        _this.cur = index
      }
    }
  }
</script>

<!-- Add "scoped" attribute to limit CSS to this component only -->
<style scoped lang="stylus">
  @import "./Game.styl"
</style>
