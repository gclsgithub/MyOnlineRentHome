<%--
  Created by IntelliJ IDEA.
  User: gcl
  Date: 2018/4/19
  Time: 上午9:25
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<link href="${pageContext.request.contextPath}/css/bootstrap.css" rel="stylesheet">
<link href="${pageContext.request.contextPath}/css/hourseDetial.css" rel="stylesheet">
<script src="${pageContext.request.contextPath}/js/jquery-1.10.2.min.js"></script>
<script src="${pageContext.request.contextPath}/js/jquery.SuperSlide.2.1.1.js"></script>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/H-ui.css" />
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}css/H-ui.ie.css" />
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/H-ui.reset.css" />
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/MyIndexStyle.css" />
<link href="http://img.jigao616.com/css/bootstrap.min.css" rel="stylesheet">
<link href="http://img.jigao616.com/css/style.css" rel="stylesheet">
<head>
    <title>房屋详细</title>
</head>
<body>
<script src="${pageContext.request.contextPath}/js/canvas-nest.js"></script><nav class="navbar navbar-diy">
    <nav class="navbar navbar-diy">
        <div class="container">
            <div class="navbar-header">
                <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#navbar" aria-expanded="false" aria-controls="navbar">
                    <span class="sr-only">在线租房</span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                </button>
                <a class="navbar-brand" href="http://localhost:8091/Index.jsp/"></a>
            </div>
            <div id="navbar" class="collapse navbar-collapse">
                <ul class="nav navbar-nav">
                    <li class="active"><a href="http://localhost:8091/MyIndex.jsp/">首页</a></li>
                    <li><a href="${pageContext.request.contextPath}/hourse/seachHourseByName.do?searchName=''">可租列表</a></li>
                </ul>
                <ul id="top1_denglu" class="nav navbar-nav navbar-right">
                    <li><a href="${pageContext.request.contextPath}/jump/regex.do">登录</a></li>
                    <li><a href="${pageContext.request.contextPath}/jump/login.do">注册</a></li>
                </ul>
            </div>
            <!--/.nav-collapse -->
            <div class="navbar-form navbar-left topsearch" role="search">
                <form action="${pageContext.request.contextPath}/hourse/seachHourseByName.do" method="get">
                    <input name="searchName" type="text" class="top-control" placeholder="房屋信息..." id="patentText" onkeydown= "if(event.keyCode==13){patentS(); return false;}">
                    <button type="submit" class="btn btn-so" onclick="patentS();return false;"></button>
                </form>
            </div>
        </div>
    </nav>
</nav>
<form action="${pageContext.request.contextPath}/generateHourseRentContact/${rentType}.do" method="post" class="form form-horizontal" id="demoform-1">
    <input type="hidden" name="hourseId" value="${hourseId}">

    <legend>房屋详细</legend>
    <div id="slider-3" style="margin-left: 230px;">
        <div class="slider">
            <div class="bd">
                <ul>
                    <li><a href="#" target="_blank"><img src="${pageContext.request.contextPath}/images/banner-1.jpg" ></a></li>
                    <li><a href="#" target="_blank"><img src="${pageContext.request.contextPath}/images/banner-2.jpg" ></a></li>
                    <li><a href="#" target="_blank"><img src="${pageContext.request.contextPath}/images/banner-3.jpg" ></a></li>
                </ul>
            </div>
            <ol class="hd cl dots">
                <li>1</li>
                <li>2</li>
                <li>3</li>
            </ol>
        </div>
    </div>
    <div class="row cl">
        <label class="form-label col-xs-4 col-sm-3">房屋：</label>
        <div class="formControls col-xs-8 col-sm-9">
            <label class="form-label col-xs-4 col-sm-3">${hourse.hourseName}</label>
        </div>
    </div>
    <div class="row cl">
        <label class="form-label col-xs-4 col-sm-3">房屋地址：</label>
        <div class="formControls col-xs-8 col-sm-9">
            <label class="form-label col-xs-4 col-sm-3">${address.city} ${address.town} ${address.area}</label>
        </div>
    </div>
    <div class="row cl">
        <label class="form-label col-xs-4 col-sm-3">房屋特色：</label>
        <div class="formControls col-xs-8 col-sm-9">
            <label class="form-label col-xs-4 col-sm-3">${hourse.keyWord}</label>
        </div>
    </div>
    <legend>租户信息</legend>
        <div class="row cl">
            <label class="form-label col-xs-4 col-sm-3">出租户：</label>
            <div class="formControls col-xs-8 col-sm-9">
                <label class="form-label col-xs-4 col-sm-3">${user.userName}</label>
            </div>
        </div>
        <div class="row cl">
            <label class="form-label col-xs-4 col-sm-3">联系电话：</label>
            <div class="formControls col-xs-8 col-sm-9">
                <label class="form-label col-xs-4 col-sm-3">${user.telPhone}</label>
            </div>
        </div>
    <legend>${rentMSG}</legend>
        <c:forEach items="${rentUserList}" var="user">
            <div class="row cl">
                <label class="form-label col-xs-4 col-sm-3">合租者：</label>
                <div class="formControls col-xs-8 col-sm-9">
                    <label class="form-label col-xs-4 col-sm-3">${user.userName}</label>
                </div>
                <label class="form-label col-xs-4 col-sm-3">联系电话：</label>
                <div class="formControls col-xs-8 col-sm-9">
                    <label class="form-label col-xs-4 col-sm-3">${user.telPhone}</label>
                </div>

                <label class="form-label col-xs-4 col-sm-3">性别：</label>
                <div class="formControls col-xs-8 col-sm-9">
                    <label class="form-label col-xs-4 col-sm-3">${user.sex}</label>
                </div>
            </div>
        </c:forEach>
    <div class="row cl">
        <label class="form-label col-xs-4 col-sm-3">租房方式：</label>
        <div class="formControls col-xs-8 col-sm-9">
            <select class="select" size="1" name="rentType" onchange="searchSingleMoney()">
                <option value="" selected>请选择</option>
                <option value="1">整租</option>
                <option value="2">合租</option>
            </select>
        </div>
        <div class="row cl">
            <label class="form-label col-xs-4 col-sm-3">金额：</label>
            <div class="formControls col-xs-8 col-sm-9">
                <input type="text" name="singleMoney" readonly="readonly" value="${hourse.singleMoney}">
            </div>
        </div>
    </div>

    <div class="row cl">
        <div class="formControls col-xs-8 col-sm-9">
            <label class="form-label col-xs-4 col-sm-3">${MSG}</label>
        </div>
    </div>
    <div class="row cl">
        <div class="col-xs-8 col-sm-9 col-xs-offset-4 col-sm-offset-3">
            <input class="btn btn-primary radius" type="submit" value="确认租房">
        </div>
    </div>
    <input type="hidden" name="flag" value="${flag}">
</form>
<footer class="footer mt-20">
    <div class="container-fluid">
        <nav> <a href="#" target="_blank">关于我们</a> <span class="pipe">|</span> <a href="#" target="_blank">联系我们</a> <span class="pipe">|</span> <a href="#" target="_blank">法律声明</a> </nav>
        <p>Copyright &copy;2018 hytc-gcl.net All Rights Reserved. <br>
            <a href="http://www.miitbeian.gov.cn/" target="_blank" rel="nofollow">京ICP备1000000号</a><br>
        </p>
    </div>
</footer>
<script>
    $(function(){
        jQuery("#slider-3 .slider").slide({mainCell:".bd ul",titCell:".hd li",trigger:"click",effect:"leftLoop",autoPlay:true,delayTime:700,interTime:7000,pnLoop:false,titOnClassName:"active"})});
</script>
</body>
</html>
