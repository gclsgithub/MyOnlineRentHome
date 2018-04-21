<%--
  Created by IntelliJ IDEA.
  User: gcl66
  Date: 2018/3/25
  Time: 8:55
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/H-ui.css" />
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/H-ui.ie.css" />
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/H-ui.reset.css" />
<link href="http://img.jigao616.com/css/bootstrap.min.css" rel="stylesheet">
<link href="http://img.jigao616.com/css/style.css" rel="stylesheet">
<head>
    <title>修改用户</title>
</head>
<body>
<script src="${pageContext.request.contextPath}/js/canvas-nest.js"></script><nav class="navbar navbar-diy">

    <form action="${pageContext.request.contextPath}/user/update.do" method="post" class="form form-horizontal" id="demoform-1">
    <legend>用户注册</legend>
    <div class="row cl">

        <label class="form-label col-xs-4 col-sm-3">用户名：</label>
        <div class="formControls col-xs-8 col-sm-9">
            <input name="userName" type="text" class="input-text" autocomplete="off" placeholder="帐号" value="${user.userName}">
            <input name="userId" type="hidden" class="input-text" autocomplete="off" placeholder="帐号" value="${user.userId}">
        </div>
    </div>
    <div class="row cl">
        <label class="form-label col-xs-4 col-sm-3">密码框：</label>
        <div class="formControls col-xs-8 col-sm-9">
            <input name="passWord" type="password" class="input-text" autocomplete="off" placeholder="密码" value="${user.passWord}">
        </div>
    </div>
    <div class="row cl">
        <label class="form-label col-xs-4 col-sm-3">手机号码：</label>
        <div class="formControls col-xs-8 col-sm-9">
            <input name="telPhone" type="text" class="input-text" autocomplete="off" placeholder="11位手机" value="${user.telPhone}">
        </div>
    </div>
    <div class="row cl">
        <label class="form-label col-xs-4 col-sm-3">性别：</label>
        <div class="formControls skin-minimal col-xs-8 col-sm-9">
            <div class="radio-box">
                <input type="radio" id="sex-1" name="sex" <c:if test="${user.sex=='男'}"></c:if>  value="man" >
                <label for="sex-1">男</label>
            </div>
            <div class="radio-box">
                <input type="radio" id="sex-0" name="sex" <c:if test="${user.sex=='女'}"></c:if> value="woman" >
                <label for="sex-0">女</label>
            </div>
        </div>
    </div>
    <div class="row cl">
        <label class="form-label col-xs-4 col-sm-3">用户级别：</label>
        <div class="formControls col-xs-8 col-sm-9">
                    <span class="select-box">
                        <select class="select" size="1" name="userType">
                            <option value="1" selected>普通用户</option>
                            <option value="1">超级管理员</option>
                            <option value="2">商家</option>
                            <option value="3">普通用户</option>
                        </select>
                    </span>
        </div>
    </div>
    <div class="row cl">
        <label class="form-label col-xs-4 col-sm-3">自我描述：</label>
        <div class="formControls col-xs-8 col-sm-9">
            <textarea class="textarea" placeholder="说点什么..." rows="" cols="" name="user.description"></textarea>
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
</nav>
</body>
</html>
