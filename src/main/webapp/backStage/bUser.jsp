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
<head>
    <title>用户CURD</title>
</head>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/page.css">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/table.css">

<style type="text/css">
    .pageTest{ width: 1000px; height: 50px; margin-top: 100px;    }
    .activP{
        background-color: #367fa9!important;
        color: #fff!important;
    }
</style>
<body>

<table class="table table-border table-bordered table-hover">
    <thead>
        <tr>
            <th>编  号</th>
            <th>用户名</th>
            <th>密  码</th>
            <th>操  作</th>
        </tr>
    </thead>
    <tbody>
        <c:forEach items="userList" var="u" varStatus="start">
            <tr>
                <td>${start.index+1}</td>
                <td>${u.userName}</td>
                <td>*********</td>
                <td><a href="${pageContext.request.contextPath}/user/modifyUser.do?userId=${u.userId}">修改</a></td>
                <td><a href="${pageContext.request.contextPath}/user/deletUser.do?userId=${u.userId}">删除</a></td>
            </tr>
        </c:forEach>
    </tbody>
</table>
<div class="pageTest"></div>

<script src="http://www.jq22.com/jquery/jquery-1.10.2.js"></script>
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
