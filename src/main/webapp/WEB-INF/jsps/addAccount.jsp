<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: gcl
  Date: 2018/4/15
  Time: 下午5:14
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/H-ui.css" />
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/H-ui.ie.css" />
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/H-ui.reset.css" />
<link href="http://img.jigao616.com/css/bootstrap.min.css" rel="stylesheet">
<link href="http://img.jigao616.com/css/style.css" rel="stylesheet">
<head>
    <title>充值</title>
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
    <form action="${pageContext.request.contextPath}/account/addAccount.do" method="post" class="form form-horizontal" id="demoform-1">
        <legend>用户充值</legend>
        <div class="row cl">
            <label class="form-label col-xs-4 col-sm-3">用户名：</label>
            <div class="formControls col-xs-8 col-sm-9">
                <input name="userName" type="text" class="input-text" autocomplete="off" placeholder="帐号" value="${userName}">
            </div>
        </div>
        <c:forEach items="${accountList}" var="al">
            <div class="row cl">
                <label class="form-label col-xs-4 col-sm-3">账户名：</label>
                <div class="formControls col-xs-8 col-sm-9">
                    <input readonly="readonly" type="text" class="input-text" autocomplete="off" placeholder="帐号" value="${al.accountName}">
                </div>
            </div>
            <div class="row cl">
                <label class="form-label col-xs-4 col-sm-3">余额：</label>
                <div class="formControls col-xs-8 col-sm-9">
                    <input readonly="readonly" type="text" class="input-text" autocomplete="off" placeholder="帐号" value="${al.accountMoney}">
                </div>
            </div>
        </c:forEach>
        <div class="row cl">
            <label class="form-label col-xs-4 col-sm-3">充值金额：</label>
            <div class="formControls col-xs-8 col-sm-9">
                    <span class="select-box">
                        <select class="select" size="1" name="addMoney">
                            <option value="100" selected>100</option>
                            <option value="100">100</option>
                            <option value="500">500</option>
                            <option value="1000">1000</option>
                        </select>
                    </span>
            </div>
        </div>
        <div class="row cl">
            <div class="col-xs-8 col-sm-9 col-xs-offset-4 col-sm-offset-3">
                <input class="btn btn-primary radius" type="submit" value="提交">
            </div>
        </div>
        <input type="hidden" name="hourseId" value="${hourseId}">
    </form>
    <br><br><br><br><br><br><br><br><br>
    <footer class="footer mt-20">
        <div class="container-fluid">
            <nav> <a href="#" target="_blank">关于我们</a> <span class="pipe">|</span> <a href="#" target="_blank">联系我们</a> <span class="pipe">|</span> <a href="#" target="_blank">法律声明</a> </nav>
            <p>Copyright &copy;2018 hytc-gcl.net All Rights Reserved. <br>
                <a href="http://www.miitbeian.gov.cn/" target="_blank" rel="nofollow">京ICP备1000000号</a><br>
            </p>
        </div>
    </footer>
</nav>

</body>
</html>
