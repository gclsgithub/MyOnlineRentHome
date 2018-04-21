<%--
  Created by IntelliJ IDEA.
  User: gcl
  Date: 2018/4/16
  Time: 下午4:26
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/H-ui.css" />
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/H-ui.ie.css" />
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/H-ui.reset.css" />
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/MyIndexStyle.css" />
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/table.css">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/page.css">
<style type="text/css">
    .pageTest{ width: 1000px; height: 50px; margin-top: 100px;    }
    .activP{
        background-color: #367fa9!important;
        color: #fff!important;
    }
</style>
<head>
    <title>房屋信息CURD</title>
</head>
<body>
    <div class="clearfix">
        <form method="get" action="${pageContext.request.contextPath}/common/searchHourseByName.do">
            <input type="text" placeholder="请输入关键词" class="input-text ac_input" name="search_text" value="" id="search_text" autocomplete="off" style="width:300px"><button type="submit" class="btn btn-default" id="search_button">搜索</button>
        </form>
    </div>
<table class="table table-border table-bordered table-hover">
    <thead>
        <tr>
            <th>编  号</th>
            <th>房屋名</th>
            <th>户  主</th>
            <th>操  作</th>
        </tr>
    </thead>
    <tbody>
        <c:forEach items="${hourseList}" var="hourse" varStatus="begin">
            <tr>
                <td>${begin.index+1}</td>
                <td>${hourse.hourseName}</td>
                <td>${hourse.userName}</td>
                <td><a href="${pageContext.request.contextPath}/hourse/modifyUser.do?hourseId=${hourse.hourseId}">修改</a></td>
                <td><a href="${pageContext.request.contextPath}/hourse/deletUser.do?hourseId=${hourse.hourseId}">删除</a></td>
            </tr>
        </c:forEach>
    </tbody>
</table>
    <form action="${pageContext.request.contextPath}/jump/createHourse.do">
        <input class="btn btn-primary size-M radius" type="submit" value="添加用户信息">
    </form>

<input type="hidden" name="page" value="${currangePage}">
<div class="pageTest"></div>
<script src="${pageContext.request.contextPath}/js/jquery-1.10.2.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/page.js"></script>
<script type="text/javascript">
    $('.pageTest').page({
        leng: ${account},//分页总数
        activeClass: 'activP' , //active 类样式定义
        clickBack:function(page){
            console.log(page)
        }
    })
    // $('.pageTest').setLength(10)
</script>

</body>
</html>
