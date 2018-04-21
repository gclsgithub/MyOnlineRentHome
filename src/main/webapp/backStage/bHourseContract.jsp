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
    <title>合同CURD</title>
</head>
<body>

<table class="table table-border table-bordered table-hover">
    <thead>
        <tr>
            <th>编  号</th>
            <th>合同代号</th>
            <th>所有者</th>
            <th>操  作</th>
        </tr>
    </thead>
    <tbody>
        <tr>
            <c:forEach items="hourseContract" var="contract" varStatus="start">
                <td>${start}</td>
                <td>${contract.contractId}</td>
                <td>${contract.masterName}</td>
                <td><a href="${pageContext.request.contextPath}/generateHourseRentContact/modifyContract.do?contract.ContractId=${contract.contractId}">修改</a></td>
                <td><a href="${pageContext.request.contextPath}/generateHourseRentContact/deletContract.do?userId=${u.userId}">删除</a></td>
            </c:forEach>
        </tr>

    </tbody>
</table>

</body>
</html>
