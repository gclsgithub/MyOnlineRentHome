/*copyright Guojunhui 2014.7.14*/
function initSiteAnimation(){
    //$('.homepic').fadeOut('slow');
    setTimeout(function() {
            $("#browser-0").addClass("firstAnim");
        },
        0),
        setTimeout(function() {
                $("#browser-6").addClass("firstAnim");
            },
            100),
        setTimeout(function() {
                $("#browser-7").addClass("firstAnim");
            },
            200),
        setTimeout(function() {
                $("#browser-8").addClass("firstAnim");
            },
            300),
        setTimeout(function() {
                $("#browser-9").addClass("firstAnim");
            },
            400),
        setTimeout(function() {
                $("#browser-10").addClass("firstAnim");
            },
            500),
        setTimeout(function() {
                $("body").css({"background-color":"#02ae75"});
            },
            600)

}
function timedMsg(){
    var t=setTimeout(initSiteAnimation,0)
}

/*尺寸设置*/
function picsize(){
    var windows_w = $(window).width();
    var windows_h = $(window).height();
    var img_w = $(".homepic").width();
    var img_h = $(".homepic").height();
    var browser0_w = $("#browser-0").width();
    var browser0_w2=windows_w*0.16666;
    var x=windows_w/windows_h;
    var y=img_w/img_h;
    $(".modal-right,.slider,.slider .tabcon,.slider .tabcon li,.slider .tabcon li img").height(windows_h);
    if(x>y){$(".homepic img").width("100%").height("auto");}
    else{$(".homepic img").width("auto").height("100%");}
    var x1 = browser0_w2/windows_h;
    var y1 = 366/1140;
    if(x1>y1){
        $("#browser-0 img").css({"width":"auto","height":"100%"});
    }
    else{
        $("#browser-0 img").css({"width":"100%","height":"auto"});
    }
    $(".homepic img").width("auto").height("100%");
    $(".browser").height(windows_h);
}
/*弹出窗口*/
function modalshow(id,Qurl,hourseName,nan,nv){
    $(document.body).append(
        '<div id="modal-TEE'+id+'" class="modal">'+
        '<div class="modal-header"><a href="javascript:void(0);" class="modal-close"></a></div>'+
        '<div class="modal-body cl">'+
        '<div class="modal-left">'+
        '<div class="modal-left-con">'+
        '<a class="Qurl" href="'+Qurl+'" title="房屋主体 '+hourseName+'的站酷个人主页" target="_blank"></a>'+
        '<div class="buyBox2">&nbsp;&nbsp;&nbsp;&nbsp;<a class="btn-nan2" href="'+nan+'" target="_blank" >整租</a> <a class="btn-nv2" href="'+nv+'" target="_blank">合租</a></div>'+
        '</div>'+
        '</div>'+
        '<div class="modal-right">'+
        '<div class="slider cl">'+
        '<ul class="tabcon">'+
            '<li><img src="../images/pic/1.png"></li>'+
            '<li><img src="../images/pic/2.png"></li>'+
            '<li><img src="../images/pic/3.png"></li>'+
            '<li><img src="../images/pic/4.png"></li>'+
        '</ul>'+
        '</div>'+
        '</div>'+
        '</div>'+
        '</div>');
    $('.slider').unslider({dots: true,fluid:false});
    var windows_h = $(window).height();
    $(".slider,.slider .tabcon,.slider .tabcon li,.slider .tabcon li img").height(windows_h);
}

$(function(){
    picsize();
    $(window).resize(function(){
        picsize();
    });
    $(".homepic").click(function(){
        initSiteAnimation();
    });
    timedMsg();
    $(".browser-hover").hover(
        function(){
            $(this).addClass("hover");
            $(".browser-hover").not(this).addClass("hover2");
        },
        function(){
            $(this).removeClass("hover");
            $(".browser-hover").not(this).removeClass("hover2");
        }
    );


    /*关闭弹出层*/
    $(document).on("click",".modal-close",function(){
        modalhide();
    });
    function modalhide(){
        $(".modal").remove();
    }

});
