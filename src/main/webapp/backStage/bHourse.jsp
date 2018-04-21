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
<head>
    <title>房屋信息CURD</title>
</head>
<body>

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
        <tr>
            <c:forEach items="hourseList" var="hourse" varStatus="start">
                <td>${start}</td>
                <td>${hourse.userName}</td>
                <td>${hourse.passWord}</td>
                <td><a href="${pageContext.request.contextPath}/hourse/modifyUser.do?hourseId=${u.userId}">修改</a></td>
                <td><a href="${pageContext.request.contextPath}/hourse/deletUser.do?hourseId=${u.userId}">删除</a></td>
            </c:forEach>
        </tr>

    </tbody>
</table>

</body>
</html>
