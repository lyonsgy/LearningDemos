+ function ($) {

    function openClick() {
        alert("立即体验");
    }

    /* 根据 className 创建 backView */
    function creatBackView(className, index) {
        var div = document.createElement("div");
        div.className = className;
        div.id = index;
        var divWidth = window.innerWidth - 82;
        var aspectRatio = 668 / 824; //宽高比
        div.style.width = divWidth + "px";
        div.style.height = divWidth / aspectRatio + "px";

        var title = document.createElement("div");
        var content = document.createElement("div");
        var price = document.createElement("div");
        var gameType = document.createElement("div");
        var open = document.createElement("button");

        title.className = "title";
        title.innerText = "标\n题";
        content.className = "content";
        content.innerText = "简介";
        price.className = "price";
        price.innerText = "free";
        gameType.className = "gameType";
        gameType.innerText = "冒险游戏";
        open.className = "open";
        open.innerText = "立即体验";
        //            open.style.onclick = openClick;

        div.appendChild(title);
        div.appendChild(content);
        div.appendChild(price);
        div.appendChild(gameType);
        div.appendChild(open);

        return div;
    }

    /* 创建 number 个 backView */
    function creatBackViews(number) {
        for (var i = 0; i < number; i++) {  
            var backView = creatBackView("backView", "backView" + i);
            document.body.appendChild(backView);
        }
    }

    creatBackViews(4);

}(jQuery);
