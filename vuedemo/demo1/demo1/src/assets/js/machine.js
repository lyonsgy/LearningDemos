import store from '../../store'
import { util } from './util'
let englishNum = ['A', 'B', 'C', 'D', 'E', 'F', 'G', 'H', 'I', 'J', 'K', 'L', 'M', 'N', 'O', 'P', 'Q', 'R']
// 数字转字母
let numToEnglish = (num) => {
  return englishNum[num]
}
// 自动补0
let addZero = (num) => {
  return num < 10 ? '0' + num : num
}
// 处理秒转分
let secondToMin = (second) => {
  let m = parseInt(second / 60)
  let s = second - m*60
  return `${addZero(m)}:${addZero(s)}`
}
// 年月日去掉时分秒
let removeTime = (str) => {
  return str.split(' ')[0]
}
// 年月日、时分秒，去掉秒,并且改成.的形式
let removeSecond = (str) => {
  return util.dateFormat(new Date(str.replace(/-/g, '/')), 'yyyy.MM.dd HH:mm')
}

// 处理url
let manageUrl = (url) => {
  if (url) {
    if(url.includes('http')) {
      return url
    } else {
      return store.state.BASE_URL + '' + url
    }
  }
  return url
}
// 可以分享的情况下，处理分享内容
let manageShare = ({oData={shareTitle:'', shareDesc:'', shareImg:''}, link='', share=true}) =>  {
  let params = {
    share: share,
    data: {
      title: oData.shareTitle, // 分享标题
      desc: oData.shareDesc, // 分享描述
      link: link, // 分享链接
      imgUrl: manageUrl(oData.shareImg), // 分享图标
      success: null, // 用户确认分享后执行的回调函数
      cancel: null, // 用户取消分享后执行的回调函数
      trigger: null, // 用户点击分享按钮后执行的回调函数
      fail: null // 用户分享失败后执行的回调函数
    }
  }
  wxsdk.initConfig(params)
}
// 检测json是否为空
let testJson = (obj) => {
  if (typeof obj == 'object') {
    for (let key in obj){
      return true;//返回true，对象有值
    }
  }
  return false;//返回false，对象没有值
}

let machine = {
  addZero,
  manageUrl,
  manageShare,
  numToEnglish,
  removeTime,
  secondToMin,
  testJson,
  removeSecond
}

export default machine
