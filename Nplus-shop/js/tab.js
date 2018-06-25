;
(function ($) {
    var Tab = function (tab) {
        var _this_ = this;
        //保存单个 tab 组建
        this.tab = tab;
        //默认配置参数
        this.config = {
            //鼠标触发类型
            "triggerType": "click",
            //内容切换效果直接切换还是淡入淡出
            "effect": "default",
            //默认展示第几个 tab
            "invoke": 1,
            //定义 tab 是否自动切换，当指定为时间间隔，标识自动切换并按指定时间间隔切换
            "auto": false
        };

        //如果配置参数存在，就扩展默认的配置参数
        if (this.getconfig()) {
            $.extend(this.config, this.getconfig());
        };

        //保存 tab 标签列表，对应的内容列表
        this.tabItems = this.tab.find("ul.tab-nav li");
        this.contentItems = this.tab.find("div.content-wrap div.content-item");

        //保存配置参数
        var config = this.config;
        if (config.triggerType === "click") {
            this.tabItems.bind(config.triggerType, function () {
                _this_.invoke($(this));
            });
        } else if (config.triggerType === "mouseover" || config.triggerType != "click") {
            this.tabItems.mouseover(function () {
                var self = $(this);
                this.timer = window.setTimeout(function () {
                    _this_.invoke(self);

                }, 300);

            }).mouseout(function () {
                window.clearTimeout(this.timer);

            });
        };

        //自动切换功能，当配置了时间就根据时间间隔进行自动切换
        if (config.auto) {
            //定义一个全局定时器
            this.timer = null;
            //计数器
            this.loop = 0;

            this.autoPlay();

            this.tab.hover(function () {
                window.clearInterval(_this_.timer);

            }, function () {

                _this_.autoPlay();

            });
        };

        //设置默认显示第几个 tab
        if (config.invoke > 1) {
            this.invoke(this.tabItems.eq(config.invoke - 1));

        }
    };

    Tab.prototype = {
        //自动间隔时间切换
        autoPlay: function () {
            var _this_ = this;
            tabItems = this.tabItems; //临时保存 tab 列表
            tabLength = tabItems.size(); //tab的个数
            config = this.config;
            this.timer = window.setInterval(function () {
                _this_.loop++;
                if (_this_.loop >= tabLength) {
                    _this_.loop = 0;

                };
                tabItems.eq(_this_.loop).trigger(config.triggerType);
            }, config.auto);
        },

        //事件驱动函数
        invoke: function (currentTab) {
            var _this_ = this;
            /***
             * 要执行 Tab 的选中状态，当前选中的加上 actived（标记为白底）
             * 切换对应的 tab 内容，要根据配置参数的 effect 是 default 还是 fade
             */

            var index = currentTab.index();
            //tab 选中状态 
            currentTab.addClass("actived").siblings().removeClass("actived");
            //切换对应的内容区域
            var effect = this.config.effect;
            var conItems = this.contentItems;
            if (effect === "default" || effect != "fade") {
                conItems.eq(index).addClass("current").siblings().removeClass("current");
            } else if (effect === "fade") {
                conItems.eq(index).fadeIn().siblings().fadeOut();
            }

            //如果配置了自动切换，记得把当前的 loop 的值设置成当前 tab 的 index
            if (this.config.auto) {
                this.loop = index;
            }
        },

        //获取配置参数
        getconfig: function () {
            //拿到 tab elem 节点上的data-config
            var config = this.tab.attr("data-config");

            //确保有配置参数
            if (config && config != "") {

                return $.parseJSON(config);
            } else {

                return null;
            };
        }
    };

    Tab.init = function (tabs) {

        var _this_ = this;

        tabs.each(function () {

            new _this_($(this));

        });

    };

    //注册成 jq 方法
    $.fn.extend({
        tab: function () {

            this.each(function () {

                new Tab($(this));
            })
            return this;
        }
    });
    window.Tab = Tab;
})(jQuery);
