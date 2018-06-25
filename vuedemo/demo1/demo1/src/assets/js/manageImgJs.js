import exif from 'exif-js'

/**
 * Created by ybq on 2017/10/16.
 */

let manageImg = {
  tuOk : false,
  tu : "",//上传的图片后第一次处理好的src
  tu2 : "",//上传的图片后需要保存的src
  intW : 330,//图片的最大宽度
  intH : 330,//图片的最大高度度
  start_X : 0,//初始X位置
  start_Y : 0,//初始Y位置
  imgW : 0,//处理好的图片的宽
  imgH : 0,//处理好的图片的高
  x : 0,//图片X方向位移
  y : 0,//图片Y方向位移
  s : 1,//图片缩放比例
  cutImgW : 330,//裁切区域的宽
  cutImgH : 330,//裁切区域的高
  startX : 0,
  startY : 0,
  moveX : 0,
  moveY : 0,
  disX : 0,
  disY:0,
  endX : 0,
  endY : 0,
  edsX : 0,//手指松开后存X位置
  edsY : 0,//手指松开后存Y位置
  c : {
    x: 0,
    y: 0
  },//存储图片中心点位置
  newP : {
    x: 0,
    y: 0
  },//通过c计算出最新img的位置
  minX : 0,//最小X
  minY : 0,//最小Y
  maxX : 0,//最大X
  maxY : 0,//最大Y
  oriW:0,
  oriH:0,//存储原始W,H
  okURL:0,//存储上传的图片
  yMove : 0,//下移高度
  downS:null,
  oldS:null,

  cutShow(){
    let _this = this;
    const oImg = new Image();
    oImg.src = this.tu;
    oImg.onload = function () {
      $('#hit').get(0).addEventListener('touchstart', _this.fnDown.bind(_this), false);
      $('.loading').hide();
      _this.tuOk = true;
      _this.oriW = _this.imgW = this.naturalWidth;
      _this.oriH = _this.imgH = this.naturalHeight;
      $('#hit').attr('src', oImg.src);

      $(window).scrollTop(0);
      $('.personalData-in').css('overflow','hidden');
      $('.text-in').slideDown();
      $('.text-in').css('display','flex');

      _this.start_X = Math.round((_this.cutImgW - this.naturalWidth) / 2);
      _this.start_Y = Math.round((_this.cutImgH - this.naturalHeight) / 2);
      console.log(this.naturalWidth, this.naturalHeight)
      $('#hit').css({
        'width':this.naturalWidth/100+'rem',
        'height':this.naturalHeight/100+'rem'
      });
      _this.resetElement();
      _this.fnAct();
    };
  },

  //选择照片
  selectFileImage(e){
    let _this = this;
    const file = e.target.files[0]
    let Orientation = null;

    if (file) {
      this.fnLoading();
      //获取照片方向角属性，用户旋转控制
      exif.getData(file, function () {
        exif.getAllTags(this);
        Orientation = exif.getTag(this, 'Orientation');
      });
      var oReader = new FileReader();
      oReader.onload = function (e) {
        var image = new Image();
        image.src = e.target.result;
        image.onload = function () {
          let w = this.naturalWidth;  //获取图片原始大小
          let h = this.naturalHeight;
          let expectWidth, expectHeight;
          _this.tu = managePng(_this.intW,_this.intH);
          function managePng(intW,intH){
            if(w>=h){
              if (h > intH) {
                expectHeight = intH;
                expectWidth = expectHeight * w / h;
              } else {
                expectWidth = w;
                expectHeight = h;
              }
            }else{
              if (w > intW) {
                expectWidth = intW;
                expectHeight = expectWidth *  h/ w;
                if(expectHeight<intH){
                  expectHeight = intH;
                  expectWidth = expectHeight * w / h;
                }
              } else {
                expectWidth = w;
                expectHeight = h;
              }
            }
            var canvas = document.createElement("canvas");
            var ctx = canvas.getContext("2d");
            canvas.width = expectWidth;
            canvas.height = expectHeight;
            var base64 = null;
            var xpos = canvas.width / 2;
            var ypos = canvas.height / 2;
            //如果方向角不为1，都需要进行旋转
            if (Orientation && Orientation != "" && Orientation != 1) {
              var degree = 0;
              switch (Orientation) {
                case 6://需要顺时针（向左）90度旋转
                  degree = 90;
                  canvas.width = expectHeight;
                  canvas.height = expectWidth;
                  ctx.rotate(degree * Math.PI / 180);
                  ctx.drawImage(image, 0, -expectHeight, expectWidth, expectHeight);
                  break;
                case 8://需要逆时针（向右）90度旋转  ;
                  degree = -90;
                  canvas.width = expectHeight;
                  canvas.height = expectWidth;
                  ctx.rotate(degree * Math.PI / 180);
                  ctx.drawImage(image, -expectWidth, 0, expectWidth, expectHeight);
                  break;
                case 3://需要180度旋转
                  degree = -180;
                  ctx.rotate(degree * Math.PI / 180);
                  ctx.drawImage(image, -expectWidth, -expectHeight, expectWidth, expectHeight);
                  break;
              }
            } else {
              ctx.drawImage(image, 0, 0, expectWidth, expectHeight);
            }
            //上传的原图,经过压缩
            let resultTu = canvas.toDataURL("image/jpeg", 0.9);
            return  resultTu;
          }
          _this.cutShow(_this.tu);
        };
      };
      oReader.readAsDataURL(file);
    }
  },

  //重置参数
  resetElement() {
    let _this = this;
    this.x = this.start_X;
    this.y = this.start_Y;
    this.edsX = 0;
    this.edsY = 0;
    this.s = 1;
    this.c = {
      x: _this.start_X + _this.imgW / 2,
      y: _this.start_Y + _this.imgH / 2
    };
    this.getC();
  },

  //获取缩放比例
  getC() {
    let _this = this;
    if (this.s > 0) {
      this.newP = {
        x: _this.c.x - _this.imgW * _this.s / 2,
        y: _this.c.y - _this.imgH * _this.s / 2
      }
    } else {
      this.newP = {
        x: _this.c.x + _this.imgW * s / 2,
        y: _this.c.y + _this.imgH * s / 2
      }
    }
  },
  //获取两根手指之间的距离
  getS(ev) {
    let x1 = ev.targetTouches[0].pageX;
    let x2 = ev.targetTouches[1].pageX;
    let y1 = ev.targetTouches[0].pageY;
    let y2 = ev.targetTouches[1].pageY;
    let a = x1 - x2;
    let b = y1 - y2;
    let c = Math.sqrt(a * a + b * b);
    return c;
  },
  //图片上下左右范围限制
  fnLimit() {
    let _this = this;

    let disW = (this.imgW * this.s - this.imgW) / 2;
    let disH = (this.imgH * this.s - this.imgH) / 2;
    let beyondW = Math.abs(this.imgW * this.s - this.cutImgW);
    let beyongH = Math.abs(this.imgH * this.s - this.cutImgH);

    if (this.imgW * this.s <= this.cutImgW && this.imgH * this.s <= this.cutImgH) {
      this.minX = 0 + disW;
      this.minY = 0 + disH;
      this.maxX = this.cutImgW - this.imgW * this.s + disW;
      this.maxY = this.cutImgH - this.imgH * this.s + disH;
      this.changeXY();
    } else if (this.imgW * this.s <= this.cutImgW && this.imgH * this.s > this.cutImgH) {
      this.minX = 0 + disW;
      this.minY = 0 + disH - beyongH;
      this.maxX = this.cutImgW - this.imgW * this.s + disW;
      this.maxY = this.cutImgH - this.imgH * this.s + disH + beyongH;
      this.changeXY();
    } else if (this.imgW * this.s > this.cutImgW && this.imgH * this.s <= this.cutImgH) {
      this.minX = 0 + disW - beyondW;
      this.minY = 0 + disH;
      this.maxX = this.cutImgW - this.imgW * this.s + disW + beyondW;
      this.maxY = this.cutImgH - this.imgH * this.s + disH;
      this.changeXY();
    } else if (this.imgW * this.s > this.cutImgW && this.imgH * this.s > this.cutImgH) {
      this.minX = 0 + disW - beyondW;
      this.minY = 0 + disH - beyongH;
      this.maxX = this.cutImgW - this.imgW * this.s + disW + beyondW;
      this.maxY = this.cutImgH - this.imgH * this.s + disH + beyongH;
      this.changeXY();
    }
    this.fnAct();
  },

  changeXY() {
    if (this.x < this.minX) {
      this.x = this.minX;
    }
    if (this.x >this.maxX) {
      this.x = this.maxX;
    }
    if (this.y < this.minY) {
      this.y =this.minY;
    }
    if (this.y > this.maxY) {
      this.y = this.maxY;
    }
  },
  //单点触控，只改变box的位置
  fnAct() {
    $('#hit').get(0).style.WebkitTransform = 'translate3d(' + this.x/100 + 'rem,' + this.y/100 + 'rem,0) scale(' + this.s + ',' + this.s + ')';
    $('#hit').get(0).style.transform = 'translate3d(' + this.x/100 + 'rem,' + this.y/100 + 'rem,0) scale(' + this.s + ',' + this.s + ')';
  },
  //多点触控，只改变box的缩放比例
  fnBct() {
    $('#hit').get(0).style.WebkitTransform = 'scale(' + this.s + ',' + this.s + ')';
    $('#hit').get(0).style.transform = 'scale(' + this.s + ',' + this.s + ')';
  },
  //按下后触发的事件
  fnDown(ev) {
    let _this = this;
    this.oldS = this.s;
    if (ev.targetTouches.length == 2) {
      this.downS = this.getS(ev);
    }
    this.startX = ev.targetTouches[0].pageX;
    this.startY = ev.targetTouches[0].pageY;
    document.addEventListener('touchmove',_this.fnMove.bind(_this), false);
    document.addEventListener('touchend', _this.fnEnd.bind(_this), false);
    ev.preventDefault();
  },
  fnEnd(ev) {
    let _this = this;
    document.removeEventListener('touchmove', _this.fnMove, false);
    document.removeEventListener('touchend', _this.fnEnd, false);
    this.endX = ev.changedTouches[0].pageX;
    this.endY = ev.changedTouches[0].pageY;
    this.edsX = this.x - this.start_X;
    this.edsY = this.y - this.start_Y;
    this.c = {
      x: _this.edsX + _this.imgW / 2,
      y: _this.edsY + _this.imgH / 2
    };
    this.getC();
  },


  fnMove(ev) {
    let _this = this;
    this.moveX = ev.targetTouches[0].pageX;
    this.moveY = ev.targetTouches[0].pageY;
    this.disX = this.moveX - this.startX;
    this.disY = this.moveY - this.startY;
    this.x = this.disX + this.edsX + this.start_X;
    this.y = this.disY + this.edsY + this.start_Y;
    this.c = {
      x: _this.x + _this.imgW / 2,
      y: _this.y + _this.imgH / 2
    };
    if (ev.targetTouches.length == 2) {
      this.s = this.oldS * (this.getS(ev) / this.downS);
    }
    this.fnLimit();
    this.getC();
  },

  cutcut() {
    let _this = this;
    $('.loading_in p').html('正在生成');
    $('.loading').show();
    const oC = document.createElement('canvas');
    const gd = oC.getContext('2d');
    const oImg = new Image();
    const top = 0;
    const left = 0;
    oC.width = this.cutImgW;
    oC.height = this.cutImgH;
    gd.fillStyle = '#fff';
    gd.fillRect(0, 0, oC.width, oC.height);
    oImg.src = this.tu;
    oImg.onload  = ()=>{
      gd.drawImage(
        oImg,
        _this.x + (_this.imgW - _this.imgW * _this.s) / 2 - left, _this.y + (_this.imgH - _this.imgH * _this.s) / 2 - top, _this.imgW * _this.s, _this.imgH * _this.s
      );
      //上传的原始照片,压缩
      _this.okURL = oC.toDataURL("image/jpeg", 0.7);

      let newImg = new Image();
      newImg.src = _this.okURL;
      newImg.onload = function () {
        $('.data-avatar').attr('src',newImg.src).css({opacity:1})
        $('.textImg').css({color:'#000'}).html('证件照')
        $('.text-in').slideUp();
        $('.loading').hide();
      };
    };
  },
  //图片修改后更改input，并且调用loading页面
  fnLoading() {
    console.log($('.uploadfile'))
    $('.loading_in p').html('正在上传');
    $('.loading').show();
    if (this.isFirst) {
      this.isFirst = false
      $('.loadFile2').hide()
      $('.loadFile1').show()
    } else {
      this.isFirst = true
      $('.loadFile2').show()
      $('.loadFile1').hide()
    }
    // $('.loadFile').remove();
    // setTimeout(function () {
    //   $('.uploadImg').html('<input class="position full loadFile" type="file" accept="image/png, image/jpeg, image/gif, image/jpg" @change="$manageImg.selectFileImage($event)">');
    // }, 1);
  }
};
export default manageImg
