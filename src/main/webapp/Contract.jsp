<%--
  Created by IntelliJ IDEA.
  User: gcl66
  Date: 2018/4/1
  Time: 17:14
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<link rel="stylesheet" type="text/css" href="css/H-ui.css" />
<link rel="stylesheet" type="text/css" href="css/H-ui.ie.css" />
<link rel="stylesheet" type="text/css" href="css/H-ui.reset.css" />
<link href="css/bootstrap.css" rel="stylesheet">
<link href="http://img.jigao616.com/css/style.css" rel="stylesheet">
<head>
    <title>租房合同</title>
</head>
<body>
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
                    <li class="active"><a href="http://localhost:8091/Index.jsp/">首页</a></li>
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

    <form action="${pageContext.request.contextPath}/generateHourseRentContact/createContract.do" method="post" class="form form-horizontal" id="demoform-1">
        <legend>房屋契约（简要）</legend>
        <div class="row cl">
            <label class="form-label col-xs-4 col-sm-3">甲方（用户）：</label>
            <div class="formControls col-xs-8 col-sm-9">
                <input name="userName" type="text" class="input-text" autocomplete="off" placeholder="不可泄" value="${userName}" readonly="readonly">
                <input name="userId" type="hidden" class="input-text" autocomplete="off" placeholder="帐号" value="${userId}"readonly="readonly">
            </div>
        </div>
        <div class="row cl">
            <label class="form-label col-xs-4 col-sm-3">乙方（租户）：</label>
            <div class="formControls col-xs-8 col-sm-9">
                <input name="masterName" type="text" class="input-text" autocomplete="off" placeholder="帐号" value="${hc.masterName}" readonly="readonly">
                <input name="masterId" type="hidden" class="input-text" autocomplete="off" placeholder="帐号" value="${hc.masterName}" readonly="readonly">
            </div>
        </div>
        <div class="row cl">
            <label class="form-label col-xs-4 col-sm-3">单个月房租</label>
            <div class="formControls col-xs-8 col-sm-9">
                <input name="singleMoney" type="text" class="input-text" autocomplete="off" placeholder="不可泄" value="${hc.singleMoney}" readonly="readonly">
            </div>
        </div>
        <div class="row cl">
            <label class="form-label col-xs-4 col-sm-3">租用类型：</label>
            <div class="formControls skin-minimal col-xs-8 col-sm-9">
                <div class="radio-box">
                    <input type="radio" id="sex-1" name="rentType" <c:if test="${hc.rentType=='entire'}">checked="checked"</c:if> readonly="readonly">
                    <label for="sex-1">整租</label>
                </div>
                <div class="radio-box">
                    <input type="radio" id="sex-0" name="rentType" <c:if test="${hc.rentType=='monthly'}">checked="checked"</c:if>  readonly="readonly" >
                    <label for="sex-0">合租</label>
                </div>
            </div>
        </div>
        <div class="row cl">
            <label class="form-label col-xs-4 col-sm-3">租用时间：</label>
            <div class="formControls col-xs-8 col-sm-9">
                    <span class="select-box">
                        <select class="select" size="1" name="rentDay">
                            <option value="1" selected>3个月</option>
                            <option value="3">3个月</option>
                            <option value="6">6个月</option>
                            <option value="9">9个月</option>
                            <option value="12">12个月</option>
                        </select>
                    </span>
            </div>
        </div>
        <div class="row cl">
            <label class="form-label col-xs-4 col-sm-3">用户补充</label>
            <div class="formControls col-xs-8 col-sm-9">
                <textarea class="textarea" placeholder="说点什么..." rows="" cols="" name="user.description"></textarea>
            </div>
        </div>
        </div>
        <div class="row cl">
            <label class="form-label col-xs-4 col-sm-3">乙方（租户）：</label>
            <input type="checkbox" value="同意协议">
            <a href="file/用户协议.txt">用户协议</a>
        </div>
        <div class="row cl">
            <div class="col-xs-8 col-sm-9 col-xs-offset-4 col-sm-offset-3">
                <input class="btn btn-primary radius" type="submit" value="购买">
            </div>
        </div>
    </form>
    <footer class="footer mt-20">
        <div class="container-fluid">
            <nav> <a href="#" target="_blank">关于我们</a> <span class="pipe">|</span> <a href="#" target="_blank">联系我们</a> <span class="pipe">|</span> <a href="#" target="_blank">法律声明</a> </nav>
            <p>Copyright &copy;2018 hytc-gcl.net All Rights Reserved. <br>
                <a href="http://localhost:8091/AboatUs.jsp" target="_blank" rel="nofollow">京ICP备1000000号</a><br>
            </p>
        </div>
    </footer>
</body>
</html>
