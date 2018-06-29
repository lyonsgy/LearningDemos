import Vue from 'vue'
import Router from 'vue-router'
import Game from '@/components/Game/Game'
import IP from '@/components/IP/IP'

Vue.use(Router)

export default new Router({
  routes: [
    {
      path: '/Game',
      name: 'Game',
      component: Game
    },
    {
      path: '/IP',
      name: 'IP',
      component: IP
    }
  ]
})
