<%--
  Created by IntelliJ IDEA.
  User: gcl
  Date: 2018/4/20
  Time: 上午9:55
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/H-ui.css" />
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/H-ui.ie.css" />
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/H-ui.reset.css" />
<link href="http://img.jigao616.com/css/bootstrap.min.css" rel="stylesheet">
<link href="http://img.jigao616.com/css/style.css" rel="stylesheet">
<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-1.10.2.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery.provincesCity.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/provincesData.js"></script>
<head>
    <title>创造房屋</title>
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
<form action="${pageContext.request.contextPath}/hourse/createHourse.do" method="post" class="form form-horizontal" id="demoform-1">
    <legend>房屋信息登记</legend>
    <div class="row cl">
        <label class="form-label col-xs-4 col-sm-3">房屋名字：</label>
        <div class="formControls col-xs-8 col-sm-9">
            <input name="hourseName" type="text" class="input-text" autocomplete="off" placeholder="房屋名">
        </div>
    </div>
    <div class="row cl">
        <label class="form-label col-xs-4 col-sm-3">城市：</label>
        <div class="formControls col-xs-8 col-sm-9">
            <span class="select-box">
                <select class="select" size="1" name="city">
                    <option value="2" selected>北京</option>
                    <option value="2">北京</option>
                    <option value="3">上海</option>
                    <option value="4">淮安</option>
                    <option value="1">苏州</option>
                </select>
            </span>
        </div>
    </div>
    <div id="province"></div>
    <script>
        $(function(){
            $("#province").ProvinceCity()});
    </script>
    <div class="row cl">
        <label class="form-label col-xs-4 col-sm-3">特色：</label>
        <div class="formControls col-xs-8 col-sm-9">
            <div class="check-box">
                <input type="checkbox" id="checkbox-1" name="keyWord">
                <label for="checkbox-1">地铁口</label>
            </div>
            <div class="check-box">
                <input type="checkbox" id="checkbox-3" name="keyWord">
                <label for="checkbox-1">学校旁</label>
            </div>
            <div class="check-box">
                <input type="checkbox" id="checkbox-4" name="keyWord">
                <label for="checkbox-1">软件园</label>
            </div>
            <div class="check-box">
                <input type="checkbox" id="checkbox-2" checked name="keyWord">
                <label for="checkbox-2">市中心</label>
            </div>
        </div>
    </div>

    <div class="row cl">
        <label class="form-label col-xs-4 col-sm-3">性别：</label>
        <div class="formControls skin-minimal col-xs-8 col-sm-9">
            <div class="radio-box">
                <input type="radio" id="room-1" name="room" value="3" checked>
                <label>三室一厅</label>
            </div>
            <div class="radio-box">
                <input type="radio" id="room-0" name="room" value="4">
                <label>四室一厅</label>
            </div>
            <div class="radio-box">
                <input type="radio" id="room-3" name="room" value="2">
                <label>二室一厅</label>
            </div>
            <div class="radio-box">
                <input type="radio" id="room-4" name="room" value="1">
                <label>一室一厅</label>
            </div>
        </div>
    </div>
    <div class="row cl">
        <label class="form-label col-xs-4 col-sm-3">单价：</label>
        <div class="formControls col-xs-8 col-sm-9">
            <input name="singleMoney" type="text" class="input-text" autocomplete="off" placeholder="单价">
        </div>
    </div>
    <div class="row cl">
        <label class="form-label col-xs-4 col-sm-3">房屋来源：</label>
        <div class="formControls skin-minimal col-xs-8 col-sm-9">
            <div class="radio-box">
                <input type="radio" id="categoeryId-1" name="categoeryId" value="1" checked>
                <label for="categoeryId-1">个体商户</label>
            </div>
            <div class="radio-box">
                <input type="radio"  value="2" id="categoeryId-0" name="categoeryId">
                <label for="categoeryId-0">酒店房源</label>
            </div>
        </div>
    </div>
    <div class="row cl">
        <div class="col-xs-8 col-sm-9 col-xs-offset-4 col-sm-offset-3">
            <input class="btn btn-primary radius" type="submit" value="提交">
        </div>
    </div>
</form>

<footer class="footer mt-20">
    <div class="container-fluid">
        <nav> <a href="#" target="_blank">关于我们</a> <span class="pipe">|</span> <a href="#" target="_blank">联系我们</a> <span class="pipe">|</span> <a href="#" target="_blank">法律声明</a> </nav>
        <p>Copyright &copy;2018 hytc-gcl.net All Rights Reserved. <br>
            <a href="http://www.miitbeian.gov.cn/" target="_blank" rel="nofollow">京ICP备1000000号</a><br>
        </p>
    </div>
</footer>
</body>
</html>
